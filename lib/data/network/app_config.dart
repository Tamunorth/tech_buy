enum Environment { staging, production }

class AppConfig {
  static const pcIp = 'localhost';
  static Environment environment = Environment.staging;
  static const String stagingURL = 'http://$pcIp:3000/';

  static const String productionURL = "nan";
  static final coreBaseUrl =
      environment == Environment.production ? productionURL : stagingURL;
  static final bool isTestMode =
      environment == Environment.production ? false : true;

  ///API Endpoints

  static const String signUp = 'api/signup';
  static const String signIn = 'api/signin';
  static const String verifyToken = 'api/verify-token';
  static const String getUserData = 'api/';

  static const String addProduct = 'admin/add-product';
  static const String getProducts = 'admin/get-products';
  static const String deleteProduct = 'admin/delete-product';
}
