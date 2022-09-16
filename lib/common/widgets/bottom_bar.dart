import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:tech_buy/constants/env_consts.dart';
import 'package:tech_buy/features/home/screens/home_screen.dart';

import '../../features/accounts/screens/account_screen.dart';

class BottomBar extends StatefulWidget {
  static const routeName = '/bottom-bar';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;

  double bottomBarWidth = 42;

  double bottomBarBorderWidth = 5;

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    const HomeScreen(),
    const Text('Cart page='),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
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
              child: Badge(
                  elevation: 0,
                  badgeContent: const Text('2'),
                  badgeColor: Colors.white,
                  child: const Icon(Icons.shopping_cart_outlined)),
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
              child: const Icon(Icons.person_outline_outlined),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
