import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/data/data_source/local/auth_local_data_source.dart';
import '../../features/auth/data/data_source/local/auth_local_data_source_imp.dart';
import '../cache/secure_storage_data_source.dart';
import '../cache/shared_preferences_service.dart';
import '../network/dio_client.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  await _initCore();
  await _initAuth();
}

Future<void> _initCore() async {
  sl.registerLazySingleton<SecureStorageService>(
        () => SecureStorageServiceImpl(),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);

  sl.registerLazySingleton<PreferencesService>(
        () => SharedPreferencesServiceImpl(sl<SharedPreferences>()),
  );

}

Future<void> _initAuth() async {
  sl.registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSourceImp(
      secureStorageService: sl<SecureStorageService>(),
    ),
  );
  sl.registerLazySingleton<DioClient>(
        () => DioClient(sl<AuthLocalDataSource>()),
  );

}
