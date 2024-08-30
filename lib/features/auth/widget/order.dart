import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/widget/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  // Fixed the list definition
  List<String> img = [
    'https://images.pexels.com/photos/20074914/pexels-photo-20074914/free-photo-of-forest.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/20074914/pexels-photo-20074914/free-photo-of-forest.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/20074914/pexels-photo-20074914/free-photo-of-forest.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/20074914/pexels-photo-20074914/free-photo-of-forest.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Your Orders",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                "See All",
                style: TextStyle(
                  fontSize: 12,
                  color: GlobalVariables.selectedNavBarColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 170,
          padding: EdgeInsets.only(left: 10, top: 20, right: 15),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: img.length,
            itemBuilder: (context, index) {
              return SingleProduct(
                image: img[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
