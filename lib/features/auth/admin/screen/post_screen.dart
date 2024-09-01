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

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
        context: context,
        product: product,
        onSuccess: () {
          products!.removeAt(index);
          setState(() {});
        });
  }

  navigatAddproduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            appBar: AppBar(
              title: const Text('Products'),
              actions: [
                IconButton(
                  onPressed: () {
                    // Handle any action if needed
                  },
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
            body: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: products!.length,
                itemBuilder: (context, index) {
                  final productData = products![index];
                  final imageData = productData.images.isNotEmpty
                      ? productData.images[0]['data'] as String
                      : null;

                  final image =
                      imageData != null ? base64Decode(imageData) : null;

                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 140,
                          width: double.infinity,
                          child: image != null
                              ? Image.memory(
                                  image,
                                  fit: BoxFit.cover,
                                )
                              : const Placeholder(), // Use a placeholder if no image
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(productData.name),
                                    SizedBox(height: 4),
                                    Text(
                                      '\$${productData.price.toString()}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  deleteProduct(productData,
                                      index); // Handle delete action
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            floatingActionButton: FloatingActionButton(
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: navigatAddproduct,
              tooltip: "Add a Product",
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
