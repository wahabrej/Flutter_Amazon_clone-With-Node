import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopCategory extends StatefulWidget {
  const TopCategory({super.key});

  @override
  State<TopCategory> createState() => _TopCategoryState();
}

class _TopCategoryState extends State<TopCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      height: 60,
      color: Colors.white,
      child: ListView.builder(
          itemCount: GlobalVariables.carouselImages.length,
          scrollDirection: Axis.horizontal,
          itemExtent: 94,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      GlobalVariables.categoryImages[index]['image']!,
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                Text(
                  GlobalVariables.categoryImages[index]['title']!,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                )
              ],
            );
          }),
    );
  }
}
