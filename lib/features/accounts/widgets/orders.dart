import 'package:flutter/material.dart';
import 'package:tech_buy/constants/env_consts.dart';

import '../../../common/widgets/single_product.dart';

class YourOrders extends StatelessWidget {
  YourOrders({Key? key}) : super(key: key);

  List list = [
    'https://images.unsplash.com/photo-1663174493884-b916b474d78f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1663174493884-b916b474d78f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1663174493884-b916b474d78f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1663174493884-b916b474d78f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your orders',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'See all',
                style: TextStyle(
                  color: EnvConsts.selectedNavBarColor,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) => SingleProduct(
                    image: list[index],
                  )),
        ),
      ],
    );
  }
}
