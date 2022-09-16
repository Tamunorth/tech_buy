import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_buy/features/auth/bloc/auth_bloc.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthBloc>().userData;

    return Container(
      height: 40,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 114, 226, 221),
          Color.fromARGB(255, 162, 236, 233),
        ], stops: [
          0,
          1.0
        ]),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            size: 20,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Delivery to: ${user.name} - ${user.address}',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(
              Icons.arrow_drop_down,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
