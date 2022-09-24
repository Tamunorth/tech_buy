part of 'admin_bloc.dart';

@immutable
abstract class AdminEvent {}

class AddProductEvent extends AdminEvent {
  final AdminProductReq product;

  AddProductEvent(this.product);
}

class GetAllProductsEvent extends AdminEvent {}

class DeleteProductEven extends AdminEvent {
  final String id;

  DeleteProductEven(this.id);
}
