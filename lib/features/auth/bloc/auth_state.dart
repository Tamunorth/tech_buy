import 'package:tech_buy/models/sign_in/signin_res.dart';

abstract class AuthState {}

class InitialState extends AuthState {}

class LoadingState extends AuthState {}

class SuccessState extends AuthState {
  final SignInRes? user;

  SuccessState({
    this.user,
  });
}

class LoggedOutState extends AuthState {}

class ErrorState extends AuthState {
  final String message;
  final String? code;
  ErrorState({required this.message, this.code});
}
