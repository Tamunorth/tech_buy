import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tech_buy/constants/env_consts.dart';

class CarouselImage extends StatelessWidget {
  final List<File>? imageList;
  const CarouselImage({Key? key, this.imageList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageList == null
        ? CarouselSlider(
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
            ),
          )
        : CarouselSlider(
            items: imageList
                ?.map((e) => Builder(builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.file(
                          e,
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                      );
                    }))
                .toList(),
            options: CarouselOptions(
              enableInfiniteScroll: false,
              viewportFraction: 0.8,
              padEnds: true,
              height: 200,
            ),
          );
    ;
  }
}
