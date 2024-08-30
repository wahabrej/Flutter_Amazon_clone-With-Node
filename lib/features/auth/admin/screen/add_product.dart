import 'dart:io';
import 'dart:typed_data';

import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';

import 'services/admin_services.dart'; // Adjust the import path as necessary

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add_product';

  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final _addProductFormKey = GlobalKey<FormState>();

  final AdminServices adminServices = AdminServices();

  String category = 'Mobiles';
  List<File> images = [];
  List<Uint8List> webImages = [];

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() &&
        (images.isNotEmpty || webImages.isNotEmpty)) {
      adminServices.sellProduct(
        context: context,
        name: productNameController.text,
        description: descriptionController.text,
        price: double.parse(priceController.text),
        quantity: double.parse(quantityController.text),
        category: category,
        images: images, // Non-web images
        webImages: webImages, // Web images
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields and select images'),
        ),
      );
    }
  }

  @override
  void dispose() {
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  Future<List<Object?>> pickImages() async {
    final ImagePicker picker = ImagePicker();
    if (kIsWeb) {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final Uint8List imageData = await image.readAsBytes();
        return [imageData];
      }
    } else {
      final List<XFile>? pickedImages = await picker.pickMultiImage();
      if (pickedImages != null) {
        return pickedImages.map((img) => File(img.path)).toList();
      }
    }
    return [];
  }

  void selectImages() async {
    var res = await pickImages();
    if (kIsWeb) {
      setState(() {
        webImages = res.whereType<Uint8List>().toList();
      });
    } else {
      setState(() {
        images = res.whereType<File>().toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Form(
          key: _addProductFormKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              kIsWeb
                  ? webImages.isNotEmpty
                      ? CarouselSlider(
                          items: webImages.map((imageData) {
                            return Builder(
                              builder: (BuildContext context) => Image.memory(
                                imageData,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            );
                          }).toList(),
                          options: CarouselOptions(
                            height: 200,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: true,
                            viewportFraction: 0.8,
                          ),
                        )
                      : GestureDetector(
                          onTap: selectImages,
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(10),
                            dashPattern: const [10, 4],
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.folder),
                                  const SizedBox(height: 20),
                                  Text(
                                    "Select Product Image",
                                    style: TextStyle(
                                        color: Colors.grey.withOpacity(0.7)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                  : images.isNotEmpty
                      ? CarouselSlider(
                          items: images.map((i) {
                            return Builder(
                              builder: (BuildContext context) => Image.file(
                                i,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            );
                          }).toList(),
                          options: CarouselOptions(
                            height: 200,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: true,
                            viewportFraction: 0.8,
                          ),
                        )
                      : GestureDetector(
                          onTap: selectImages,
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(10),
                            dashPattern: const [10, 4],
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.folder),
                                  const SizedBox(height: 20),
                                  Text(
                                    "Select Product Image",
                                    style: TextStyle(
                                        color: Colors.grey.withOpacity(0.7)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: productNameController,
                hintText: 'Product Name',
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: descriptionController,
                hintText: 'Description',
                maxLines: 3,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: priceController,
                hintText: 'Price',
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: quantityController,
                hintText: 'Quantity',
              ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.topLeft,
                width: 200,
                child: DropdownButtonFormField(
                  value: category,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: productCategories.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newVal) {
                    setState(() {
                      category = newVal!;
                    });
                  },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: sellProduct,
                child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: const Text('Add Product')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
