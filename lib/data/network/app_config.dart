enum Environment { staging, production }

class AppConfig {
  static const pcIp = '192.168.100.31';
  static Environment environment = Environment.staging;
  static const String stagingURL = 'http://$pcIp:3000/api/';

  static const String productionURL = "nan";
  static final coreBaseUrl =
      environment == Environment.production ? productionURL : stagingURL;
  static final bool isTestMode =
      environment == Environment.production ? false : true;

  ///API Endpoints

  static const String signUp = 'signup';
  static const String signIn = 'signin';
  static const String verifyToken = 'verify-token';
  static const String getUserData = '';
}
