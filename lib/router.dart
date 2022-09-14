import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tech_buy/features/auth/screens/auth_screen.dart';
import 'package:tech_buy/features/home/screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Oops!, Wrong page 404'),
          ),
        ),
      );
  }
}

class Routers {
  static Future push(Widget screen, BuildContext? context,
          {bool clearStack = false,
          bool fullScreenDialog = false,
          PageTransitionType animationType = PageTransitionType.rightToLeft,
          bool? withNavBar = false}) =>
      !clearStack
          ? Navigator.push(context!, MaterialPageRoute(builder: (_) => screen))
          : Navigator.of(context!).pushAndRemoveUntil(
              PageTransition(
                type: animationType,
                child: screen,
              ),
              (_) => false,
            );

  static Future pushNamed(String route, BuildContext context,
          {bool clearStack = false, dynamic args = Object}) =>
      !clearStack
          ? Navigator.of(context).pushNamed(route, arguments: args)
          : Navigator.of(context)
              .pushNamedAndRemoveUntil(route, (_) => false, arguments: args);

  static void pop(BuildContext context, {bool rootNavigator = false}) {
    Navigator.of(context, rootNavigator: rootNavigator).pop();
  }

  static void removeUntil(BuildContext context, {bool rootNavigator = false}) {
    {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  static void replace(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => widget),
    );
  }

  static void replaceNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(
      context,
      routeName,
    );
  }
}
