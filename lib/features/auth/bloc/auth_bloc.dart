import 'package:bloc/bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<AuthState> emit) async {
    emit(state.clone());
  }
}
