import 'package:flutter/material.dart';
import 'package:tech_buy/features/admin/screens/post_screen.dart';

import '../../../constants/env_consts.dart';

class AdminScreen extends StatefulWidget {
  static const routeName = '/admin-screen';
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;

  double bottomBarWidth = 42;

  double bottomBarBorderWidth = 5;

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    const PostScreen(),
    const Text('View page='),
    const Text('ss page='),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
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
            children: const [
              Text(
                "<Tech Buy!/>",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Admin",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: EnvConsts.selectedNavBarColor,
        unselectedItemColor: EnvConsts.unselectedNavBarColor,
        backgroundColor: EnvConsts.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: _page == 0
                    ? EnvConsts.selectedNavBarColor
                    : EnvConsts.backgroundColor,
                width: bottomBarBorderWidth,
              ))),
              child: const Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: _page == 1
                    ? EnvConsts.selectedNavBarColor
                    : EnvConsts.backgroundColor,
                width: bottomBarBorderWidth,
              ))),
              child: const Icon(Icons.analytics_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: _page == 2
                    ? EnvConsts.selectedNavBarColor
                    : EnvConsts.backgroundColor,
                width: bottomBarBorderWidth,
              ))),
              child: const Icon(Icons.all_inbox_outlined),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
