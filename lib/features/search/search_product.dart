import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate average rating
    //  double totalRating = 0;
    //   if (product.rating != null) {
    //     for (int i = 0; i < product.rating!.length; i++) {
    //       totalRating += product.rating![i].rating;
    //     }
    //   }
    // double avgRating =
    //     totalRating != 0 ? totalRating / product.rating!.length : 0;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              // Product Image
              // if (product.images.isNotEmpty)
              //   Image.network(
              //     product.images[0], // Ensure there's at least one image
              //     fit: BoxFit.contain,
              //     height: 135,
              //     width: 135,
              //   ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Container(
                    width: 235,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  // Product Rating
                  // if (avgRating > 0)
                  //   Container(
                  //     width: 235,
                  //     padding: const EdgeInsets.only(left: 10, top: 5),
                  //     child: Stars(
                  //       rating: avgRating,
                  //     ),
                  //   ),
                  // Product Price
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      '\$${product.price}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  // Shipping Info
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text('Eligible for FREE Shipping'),
                  ),
                  // Stock Status
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: const Text(
                      'In Stock',
                      style: TextStyle(
                        color: Colors.teal,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
