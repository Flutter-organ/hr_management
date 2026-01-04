import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hr_management/core/config/app_config.dart';

import '../../features/auth/data/data_source/local/auth_local_data_source.dart';
import '../../features/auth/data/data_source/local/auth_local_data_source_imp.dart';
import '../../features/auth/data/repository_imp/auth_repository_imp.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../cashe/secure_storage_data_source.dart';

final sl = GetIt.instance;
Future<void> setupDependencies() async {
  sl.registerLazySingleton<Dio>(()=> Dio(BaseOptions(
    baseUrl: AppConfig.apiBaseUrl,
    connectTimeout: Duration(seconds: AppConfig.timeout),
    receiveTimeout:  Duration(seconds: AppConfig.timeout),
  )));

  sl.registerLazySingleton<AuthLocalDataSource>(
          () => AuthLocalDataSourceImp(
              secureStorageService: sl<SecureStorageService>()
          )
  );

  sl.registerLazySingleton<AuthRepository>(
          () => AuthRepositoryImp(
              localDataSource: sl<AuthLocalDataSource>()
          )
  );
}