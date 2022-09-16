import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_buy/common/widgets/bottom_bar.dart';
import 'package:tech_buy/features/admin/screens/admin_screen.dart';

import '../../router.dart';
import '../auth/bloc/auth_bloc.dart';
import '../auth/bloc/auth_event.dart';
import '../auth/bloc/auth_state.dart';
import '../auth/screens/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<AuthBloc>().add(VerifyJwtEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ErrorState) {
          Routers.replaceNamed(context, AuthScreen.routeName);
        }
        if (state is SuccessState) {
          if (state.user?.type == 'user') {
            Routers.replaceNamed(context, AdminScreen.routeName);
          } else {
            Routers.replaceNamed(context, BottomBar.routeName);
          }
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        return const Scaffold(body: Text(''));
      },
    );
  }
}
