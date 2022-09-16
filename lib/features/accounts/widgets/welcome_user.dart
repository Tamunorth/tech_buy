import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/env_consts.dart';
import '../../auth/bloc/auth_bloc.dart';

class WelcomeUserWidget extends StatelessWidget {
  const WelcomeUserWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(gradient: EnvConsts.appBarGradient),
      padding: const EdgeInsets.only(left: 15, right: 10, bottom: 10),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: 'Hello, ',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              children: [
                TextSpan(
                  text: '${context.read<AuthBloc>().userData.name}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
