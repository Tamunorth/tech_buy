part of 'admin_bloc.dart';

@immutable
abstract class AdminState {}

class InitialState extends AdminState {}

class LoadingState extends AdminState {}

class SuccessState extends AdminState {
  final GetProductsRes? result;

  SuccessState({this.result});
}

class GetProductsState extends AdminState {
  final GetProductsRes result;
  GetProductsState(this.result);
}

class ErrorState extends AdminState {
  final String message;

  ErrorState(this.message);
}
