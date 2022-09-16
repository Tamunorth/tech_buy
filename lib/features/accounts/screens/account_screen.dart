import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_buy/features/accounts/widgets/orders.dart';
import 'package:tech_buy/features/accounts/widgets/top_bottons.dart';

import '../../../constants/env_consts.dart';
import '../widgets/welcome_user.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: EnvConsts.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "<Tech Buy!/>",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(Icons.notifications_outlined),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const WelcomeUserWidget(),
          10.verticalSpace,
          YourOrders(),

          20.verticalSpace,

          // SingleChildScrollView(
          //   child: Wrap(
          //     children: [
          //       Expanded(
          //         child: Container(
          //           margin: EdgeInsets.all(20),
          //           height: 150,
          //           decoration: BoxDecoration(
          //             color: Colors.black.withOpacity(0.03),
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: Container(
          //           margin: EdgeInsets.all(20),
          //           height: 150,
          //           decoration: BoxDecoration(
          //             color: Colors.black.withOpacity(0.03),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
      bottomNavigationBar: const SizedBox(

height: 100,        child: TopButtonColumn(),
      ),
    );
  }
}
