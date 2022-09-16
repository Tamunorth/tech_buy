import 'package:bloc/bloc.dart';
import 'package:tech_buy/models/sign_in/signin_res.dart';
import 'package:tech_buy/models/sign_up/signup_res.dart';

import './auth_event.dart';
import '../../../data/network/session_manager.dart';
import '../../../utils/di.dart';
import '../services/auth_service.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitialState()) {
    on<InitEvent>(_init);
    on<SignUpEvent>(_signUpWithEmail);
    on<SignInEvent>(_signInWithEmail);
    on<VerifyJwtEvent>(_verifyJwt);

    on<SignOutEvent>(_signOut);
  }

  final AuthService _authService = sl<AuthService>();

  void _init(InitEvent event, Emitter<AuthState> emit) async {
    emit(state);
  }

  SignInRes userData = SignInRes();

  Future<void> _signUpWithEmail(
      SignUpEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingState());

      final SignUpRes response = await _authService.signUpUser(
          email: event.email, password: event.password, name: event.name);
      emit(SuccessState());
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }

  Future<void> _signInWithEmail(
      SignInEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingState());

      final SignInRes response = await _authService.signInUser(
        email: event.email,
        password: event.password,
      );

      userData = response;

      logger.i(response.toString());

      sl<SessionManager>().authToken = response.token!;

      logger.i(userData.toString());

      logger.i("User Token: ${sl<SessionManager>().authToken}");

      emit(SuccessState(user: response));
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }

  Future<void> _verifyJwt(VerifyJwtEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingState());

      final bool response = await _authService.verifyJwt();

      logger.i(
          "User Token: ${sl<SessionManager>().authToken} :: Compared to ${response.toString()}");

      final SignInRes user = await _authService.getUserData();

      userData = user;

      emit(SuccessState(user: userData));
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }

  Future _signOut(SignOutEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingState());

      // await _authService.signOut();

      emit(SuccessState());
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }
}
