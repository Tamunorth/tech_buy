import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_buy/features/home/widgets/address_box.dart';
import 'package:tech_buy/features/home/widgets/carouselImage.dart';
import 'package:tech_buy/features/home/widgets/deal_of_day.dart';
import 'package:tech_buy/features/home/widgets/home_app_bar.dart';
import 'package:tech_buy/features/home/widgets/top_categories.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AddressBox(),
            10.verticalSpace,
            const TopCategories(),
            10.verticalSpace,
            const CarouselImage(),
            const DealOfDay(),
          ],
        ),
      ),
    );
  }
}
