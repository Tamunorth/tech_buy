import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_buy/common/widgets/bottom_bar.dart';
import 'package:tech_buy/common/widgets/custom_textfield.dart';
import 'package:tech_buy/constants/env_consts.dart';
import 'package:tech_buy/features/admin/screens/admin_screen.dart';
import 'package:tech_buy/features/auth/bloc/auth_event.dart';
import 'package:tech_buy/router.dart';
import 'package:tech_buy/utils/app_dialogs.dart';
import 'package:tech_buy/utils/validation_helpers.dart';

import '../../../common/widgets/custom_button.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';

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

  final loadingKey = GlobalKey<FormState>();
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

  _signUp() async {
    if (_signUpForm.currentState!.validate()) {
      context.read<AuthBloc>().add(SignUpEvent(
          name: _nameController.text.trim(),
          email: _emailController.text.trim().toLowerCase(),
          password: _passwordController.text.trim()));
    }
  }

  _signIn() async {
    if (_signInForm.currentState!.validate()) {
      context.read<AuthBloc>().add(
            SignInEvent(
              email: _emailController.text.trim().toLowerCase(),
              password: _passwordController.text.trim(),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome! ',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  16.verticalSpace,
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Sign Up'),
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
                    title: const Text('Sign In'),
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
                            validator: FieldValidators.nameValidator,
                          ),
                          TextBoxField(
                            controller: _emailController,
                            hintText: 'Email',
                            validator: FieldValidators.emailValidator,
                          ),
                          TextBoxField(
                            controller: _passwordController,
                            hintText: 'Password',
                            isPassword: true,
                            validator: FieldValidators.createPasscodeValidator,
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
                            validator: FieldValidators.emailValidator,
                          ),
                          TextBoxField(
                            controller: _passwordController,
                            hintText: 'Password',
                            isPassword: true,
                            validator: FieldValidators.createPasscodeValidator,
                          ),
                        ],
                      ),
                    ),
                  50.verticalSpace,
                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is SuccessState) {
                        if (_authType == AuthType.signIn) {
                          if (state.user?.type == 'admin') {
                            Routers.replaceNamed(
                                context, AdminScreen.routeName);
                          } else {
                            Routers.replaceNamed(context, BottomBar.routeName);
                            TechBuy.showSnackBar(context, "Inside the app now");
                          }
                        } else {
                          setState(() {
                            _authType = AuthType.signIn;
                          });
                          TechBuy.showSnackBar(
                              context, "Account created, Please login");
                        }
                      } else if (state is ErrorState) {
                        TechBuy.showSnackBar(context, state.message,
                            type: SnackType.error);
                      }
                    },
                    child: CustomTextButton(
                      text:
                          _authType == AuthType.signUp ? 'Sign Up' : 'Sign In',
                      isLoading: state is LoadingState,
                      onTap: _authType == AuthType.signUp ? _signUp : _signIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
