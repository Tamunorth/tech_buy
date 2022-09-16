import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  final imageLink =
      'https://images.unsplash.com/photo-1663264881369-2f1accd68b13?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(
            left: 10,
            top: 15,
          ),
          child: const Text(
            'Deal of the Day',
            style: TextStyle(fontSize: 20),
          ),
        ),
        10.verticalSpace,
        Image.network(
          imageLink,
          height: 250,
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '\$999.00',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                'Apple Mac book pro 2020',
                style: TextStyle(
                  fontSize: 14,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                imageLink,
                height: 100,
                width: 100,
                fit: BoxFit.fitWidth,
              ),
              Image.network(
                imageLink,
                height: 100,
                width: 100,
                fit: BoxFit.fitWidth,
              ),
              Image.network(
                imageLink,
                height: 100,
                width: 100,
                fit: BoxFit.fitWidth,
              ),
              Image.network(
                imageLink,
                height: 100,
                width: 100,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.topLeft,
          child: const Text(
            'See all deals',
            style: TextStyle(color: Colors.cyan, fontSize: 15),
          ),
        )
      ],
    );
  }
}
