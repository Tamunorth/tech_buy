import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_buy/constants/env_consts.dart';
import 'package:tech_buy/features/auth/screens/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 780),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Tech Buy',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: EnvConsts.backgroundColor,
                appBarTheme: const AppBarTheme(
                  elevation: 0,
                  centerTitle: true,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                ),
                colorScheme: const ColorScheme.light(
                  primary: EnvConsts.secondaryColor,
                )),
            // onGenerateRoute: (settings) => generateRoute(settings),
            home: AuthScreen(),
          );
        });
  }
}
