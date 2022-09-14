import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_buy/common/widgets/custom_button.dart';
import 'package:tech_buy/features/auth/bloc/auth_event.dart';
import 'package:tech_buy/features/auth/bloc/auth_state.dart';

import '../../auth/bloc/auth_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userState = context.read<AuthBloc>().state as SuccessState;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(child: Text(userState.user?.token ?? '')),

          CustomTextButton(text: 'text' , onTap: () {


            context.read<AuthBloc>().add(VerifyJwtEvent());

          },),
        ],
      ),
    );
  }
}
