import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/features/auth/admin/screen/add_product.dart';
import 'package:amazon_clone/features/auth/admin/screen/services/admin_services.dart';
import 'package:amazon_clone/models/product.dart';

class PostScreen extends StatefulWidget {
  static const String routeName = '/post_screen';
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  navigatAddproduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            body: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2), // Ensure this is an int
                itemCount: products!.length, // Ensure this is an int
                itemBuilder: (context, index) {
                  final productData = products![index];

                  // Debugging: Check the type of imageData
                  final imageData = productData.images.isNotEmpty
                      ? productData.images[0]['data'] as String
                      : null;

                  print('Image data type: ${imageData.runtimeType}'); // Debugging

                  final image = imageData != null ? base64Decode(imageData) : null;

                  return Column(
                    children: [
                      SizedBox(
                        height: 140,
                        child: image != null
                            ? Image.memory(
                                image,
                                fit: BoxFit.cover,
                              )
                            : const Placeholder(), // Use a placeholder if no image
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(child: Text(productData.name)),
                        ],
                      )
                    ],
                  );
                }),
            floatingActionButton: FloatingActionButton(
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: navigatAddproduct,
              tooltip: "Add a Product",
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
