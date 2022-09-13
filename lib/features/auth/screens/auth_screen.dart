import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_buy/common/widgets/custom_textfield.dart';
import 'package:tech_buy/constants/env_consts.dart';

import '../../../common/widgets/custom_button.dart';

enum AuthType { signIn, signUp }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _signInForm = GlobalKey<FormState>();
  final _signUpForm = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _passwordController.dispose();
    _nameController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  AuthType _authType = AuthType.signUp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome! ',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              16.verticalSpace,
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Sign Up'),
                onTap: () {
                  setState(() {
                    _authType = AuthType.signUp;
                  });
                },
                leading: Radio(
                    activeColor: EnvConsts.secondaryColor,
                    value: AuthType.signUp,
                    groupValue: _authType,
                    onChanged: (AuthType? value) {
                      setState(() {
                        _authType = value!;
                      });
                    }),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    _authType = AuthType.signIn;
                  });
                },
                contentPadding: EdgeInsets.zero,
                title: Text('Sign In'),
                leading: Radio(
                    activeColor: EnvConsts.secondaryColor,
                    value: AuthType.signIn,
                    groupValue: _authType,
                    onChanged: (AuthType? value) {
                      setState(() {
                        _authType = value!;
                      });
                    }),
              ),
              if (_authType == AuthType.signUp)
                Form(
                  key: _signUpForm,
                  child: Column(
                    children: [
                      TextBoxField(
                        controller: _nameController,
                        hintText: 'Name',
                      ),
                      TextBoxField(
                        controller: _emailController,
                        hintText: 'Email',
                      ),
                      TextBoxField(
                        controller: _passwordController,
                        hintText: 'Password',
                      ),
                    ],
                  ),
                )
              else
                Form(
                  key: _signInForm,
                  child: Column(
                    children: [
                      TextBoxField(
                        controller: _emailController,
                        hintText: 'Email',
                      ),
                      TextBoxField(
                        controller: _passwordController,
                        hintText: 'Password',
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20),
        child: CustomTextButton(
          text: _authType == AuthType.signUp ? 'Sign Up' : 'Sign In',
          onTap: () {},
        ),

        // child: ,
      ),
    );
  }
}
