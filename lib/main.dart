import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_buy/constants/env_consts.dart';
import 'package:tech_buy/features/auth/screens/auth_screen.dart';
import 'package:tech_buy/router.dart';
import 'package:tech_buy/utils/di.dart';

import 'common/network/app_config.dart';
import 'features/auth/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await initializeApp(environment: Environment.staging);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: ThemeMode.system == ThemeMode.dark
          ? Brightness.light
          : Brightness.dark,
      statusBarBrightness: ThemeMode.system == ThemeMode.dark
          ? Brightness.light
          : Brightness.dark,
    ));
    return ScreenUtilInit(
        designSize: const Size(360, 780),
        minTextAdapt: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<AuthBloc>(
                create: (context) => AuthBloc(),
              ),
            ],
            child: MaterialApp(
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
              onGenerateRoute: (settings) => generateRoute(settings),
              home: AuthScreen(),
            ),
          );
        });
  }
}
