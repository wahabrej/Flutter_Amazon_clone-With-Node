import 'package:amazon_clone/constants/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

class CarosalImage extends StatelessWidget {
  const CarosalImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map((i) {
        return Builder(
          builder: (BuildContext context) => Image.network(
            i,
            fit: BoxFit.cover,
            height: 200,
          ),
        );
      }).toList(), // Convert the Iterable to a List
      options: CarouselOptions(
        height: 200, // You may specify options like height, autoPlay, etc.
        autoPlay: true,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        viewportFraction: 0.8,
      ),
    );
  }
}
