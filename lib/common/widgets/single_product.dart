import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black.withOpacity(0.05),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SizedBox(
            width: 180,
            child: Image.network(
              image,
              fit: BoxFit.fitHeight,
              width: 180,
            )),
      ),
    );
  }
}
