import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:tech_buy/features/auth/services/auth_service.dart';

import '../data/network/app_config.dart';
import '../data/network/network_service.dart';
import '../data/network/session_manager.dart';

/// Creating a singleton instance of GetIt.
final sl = GetIt.instance;

///LazySingleton Logger variable
final logger = sl<Logger>();

Future<void> initializeApp({required Environment environment}) async {
  ///Initialize services here
  ///
  await initCore();
  await initServices();
}

Future<void> initCore() async {
  final sessionManager = SessionManager();
  await sessionManager.init();
  sl.registerLazySingleton<SessionManager>(() => sessionManager);
}

Future<void> initServices() async {
  sl.registerLazySingleton(() => Logger());
  sl.registerLazySingleton<NetworkService>(
      () => NetworkService(baseUrl: AppConfig.coreBaseUrl));
  sl.registerLazySingleton(() => AuthService(
        networkService: sl(),
      ));
}
