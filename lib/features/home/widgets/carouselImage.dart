import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tech_buy/constants/env_consts.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: EnvConsts.carouselImages
            .map((e) => Builder(builder: (context) {
                  return Image.network(
                    e,
                    fit: BoxFit.cover,
                    height: 200,
                  );
                }))
            .toList(),
        options: CarouselOptions(
          viewportFraction: 1,
          autoPlay: true,
          height: 200,
        ));
  }
}
