import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  const SingleProduct({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 174, 165, 165),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white),
      child: Container(
        width: 180,
        padding: EdgeInsets.all(10),
        child: Image.network(
          image,
          fit: BoxFit.fitHeight,
          width: 180,
        ),
      ),
    );
  }
}
