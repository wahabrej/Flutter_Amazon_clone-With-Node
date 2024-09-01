import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:amazon_clone/providers/user_provider.dart';

class AdminServices {
  Future<void> sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images, // Non-web images
    required List<Uint8List> webImages, // Web images
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$uri/admin/add-product'),
      )
        ..headers['x-auth-token'] = userProvider.user.token
        ..fields['name'] = name
        ..fields['description'] = description
        ..fields['quantity'] = quantity.toString()
        ..fields['price'] = price.toString()
        ..fields['category'] = category;

      // Add non-web images to the request
      for (var image in images) {
        request.files.add(
          http.MultipartFile.fromBytes(
            'images',
            await image.readAsBytes(),
            filename: 'image_${DateTime.now().millisecondsSinceEpoch}.jpg',
          ),
        );
      }

      // Add web images to the request
      for (var imageData in webImages) {
        request.files.add(
          http.MultipartFile.fromBytes(
            'images',
            imageData,
            filename: 'image_${DateTime.now().millisecondsSinceEpoch}.jpg',
          ),
        );
      }

      final response = await request.send();
      final res = await http.Response.fromStream(response);

      print('Status code: ${res.statusCode}');
      print('Response body: ${res.body}');

      if (res.statusCode >= 200 && res.statusCode < 300) {
        showSnacBar(context, "Product added successfully");
        Navigator.pop(context);
      } else {
        showSnacBar(
            context, 'Failed to add product: ${res.statusCode} - ${res.body}');
      }
    } catch (e) {
      print('Error: $e');
      showSnacBar(context, 'An error occurred: ${e.toString()}');
    }
  }

  // get all the products
  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/get-products'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });
      print(res);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnacBar(context, e.toString());
    }
    return productList;
  }

  //delete product

  void deleteProduct({
    required BuildContext context,
    required Product product,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnacBar(context, e.toString());
    }
  }
}
