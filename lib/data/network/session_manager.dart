// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/di.dart';

/// A class for managing sessions, handles saving and retrieving of data
class SessionManager {
  SessionManager._internal();

  SharedPreferences? sharedPreferences;

  static final SessionManager _instance = SessionManager._internal();

  factory SessionManager() => _instance;

  static SessionManager get instance => _instance;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String KEY_USERS_DATA = 'usersData';
  static const String KEY_AUTH_TOKEN = 'authToken';
  static const String KEY_AUTH_BEARER = 'tokenBearer';
  static const String KEY_IS_LOGIN = 'is_logged_in';
  // static const String IS_CAMERA_CONSCENT_ALLOWED = 'is_camera_conscent_allowed';
  // static const String IS_FILE_CONSCENT_ALLOWED = 'is_file_conscent_allowed';
  // static const String IS_DOWNLOAD_INITIALIZED = 'is_download_initialized';

  String get authToken => sharedPreferences!.getString(KEY_AUTH_TOKEN) ?? '';

  String get bearer => sharedPreferences!.getString(KEY_AUTH_BEARER) ?? '';

  Map get usersData =>
      json.decode(sharedPreferences!.getString(KEY_USERS_DATA) ?? '');

  set usersData(Map map) =>
      sharedPreferences!.setString(KEY_USERS_DATA, json.encode(map));

  set authToken(String authToken) =>
      sharedPreferences!.setString(KEY_AUTH_TOKEN, authToken);

  set bearer(String bearer) =>
      sharedPreferences!.setString(KEY_AUTH_BEARER, bearer);

  set isLoggedIn(bool loggedIn) {
    sharedPreferences!.setBool(KEY_IS_LOGIN, loggedIn);
  }

  // set isCameraConscentAllowed(bool allowed) {
  //   sharedPreferences!.setBool(IS_CAMERA_CONSCENT_ALLOWED, allowed);
  // }

  // set isDownloadInitialized(bool initialized) {
  //   sharedPreferences!.setBool(IS_DOWNLOAD_INITIALIZED, initialized);
  // }

  // set isFileConscentAllowed(bool allowed) {
  //   sharedPreferences!.setBool(IS_FILE_CONSCENT_ALLOWED, allowed);
  // }

  bool get isLoggedIn => sharedPreferences!.getBool(KEY_IS_LOGIN) ?? false;

  // bool get isDownloadInitialized =>
  //     sharedPreferences!.getBool(IS_DOWNLOAD_INITIALIZED) ?? false;

  // bool get isCameraConscentAllowed =>
  //     sharedPreferences!.getBool(IS_CAMERA_CONSCENT_ALLOWED) ?? false;

  // bool get isFileConscentAllowed =>
  //     sharedPreferences!.getBool(IS_FILE_CONSCENT_ALLOWED) ?? false;

  Future<bool> logOut() async {
    await sharedPreferences!.clear();
    // await HiveBoxes.clearAllBox();
    try {
      final cacheDir = await getTemporaryDirectory();
      if (cacheDir.existsSync()) {
        cacheDir.deleteSync(recursive: true);
      }
      final appDir = await getApplicationSupportDirectory();
      if (appDir.existsSync()) {
        appDir.deleteSync(recursive: true);
      }
    } catch (e) {
      logger.e("error clearing cache: $e");
    }
    return true;
  }
}
