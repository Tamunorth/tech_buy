import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tech_buy/features/admin/models/add_product/add_product_req.dart';
import 'package:tech_buy/features/admin/models/get_products_res.dart';
import 'package:tech_buy/features/admin/services/admin_service.dart';

import '../../../utils/di.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc() : super(InitialState()) {
    on<AdminEvent>((event, emit) {
      emit(state);
    });

    on<AddProductEvent>(_addProduct);
    on<GetAllProductsEvent>(_getAllProducts);
    on<DeleteProductEven>(_deleteProduct);
  }

  final AdminService _adminService = sl<AdminService>();

  GetProductsRes? productList;

  Future<void> _addProduct(
      AddProductEvent event, Emitter<AdminState> emit) async {
    try {
      emit(LoadingState());

      await _adminService.uploadProduct(event.product);
      final result = await _adminService.getAllProducts();

      productList = result;

      emit(SuccessState(result: result));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  Future<void> _getAllProducts(
      GetAllProductsEvent event, Emitter<AdminState> emit) async {
    try {
      emit(LoadingState());

      final result = await _adminService.getAllProducts();

      productList = result;

      emit(SuccessState(result: result));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  Future<void> _deleteProduct(
      DeleteProductEven event, Emitter<AdminState> emit) async {
    try {
      emit(LoadingState());

      final result = await _adminService.deleteProduct(event.id);

      emit(SuccessState());
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
