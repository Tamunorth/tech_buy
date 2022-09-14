import 'package:tech_buy/models/sign_in/sign_in_request.dart';
import 'package:tech_buy/models/sign_in/signin_res.dart';
import 'package:tech_buy/models/sign_up/signup_request.dart';
import 'package:tech_buy/models/sign_up/signup_res.dart';
import 'package:tech_buy/utils/di.dart';

import '../../../common/network/network_service.dart';
import '../../../common/network/url_config.dart';

class AuthService {
  final NetworkService networkService;

  AuthService({required this.networkService});
  Future<SignUpRes> signUpUser(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final SignUpRequest user = SignUpRequest(
        name: name,
        password: password,
        email: email,
      );

      final response = await networkService.call(
        UrlConfig.sign_up,
        RequestMethod.post,
        data: user.toJson(),
      );

      return SignUpRes.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<SignInRes> signInUser({
    required String email,
    required String password,
  }) async {
    try {
      final SignInRequest user = SignInRequest(
        password: password,
        email: email,
      );

      final response = await networkService.call(
        UrlConfig.sign_in,
        RequestMethod.post,
        data: user.toJson(),
      );

      return SignInRes.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> verifyJwt() async {
    try {
      // final Map data = {'token': sl<SessionManager>().authToken};
      final Map data = {'token': 'asssssssss'};

      final response = await networkService.call(
        UrlConfig.verify_token,
        RequestMethod.post,
        data: data,
      );
      logger.i(response.data);

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
