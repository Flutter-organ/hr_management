import 'package:get_it/get_it.dart';
import '../../features/auth/data/data_source/local/auth_local_data_source.dart';
import '../../features/auth/data/data_source/local/auth_local_data_source_imp.dart';
import '../../features/auth/data/data_source/remote/AuthRemoteDataSource.dart';
import '../../features/auth/data/data_source/remote/AuthRemoteDataSourceImp.dart';
import '../../features/auth/data/repository_imp/auth_repository_imp.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../../features/auth/domain/usecase/RegisterUseCase.dart';
import '../cache/secure_storage_data_source.dart';
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

  sl.registerLazySingleton<DioClient>(
        () => DioClient(sl<AuthLocalDataSource>()),
  );

}

Future<void> _initAuth() async {
  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImp(localDataSource: sl<AuthLocalDataSource>(), remoteDataSource: sl<AuthRemoteDataSource>()),
  );

  sl.registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSourceImp(secureStorageService: sl<SecureStorageService>()),
  );

  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(sl<DioClient>()),
  );

  sl.registerLazySingleton<RegisterUseCase>(
        () => RegisterUseCase(
          sl<AuthRepository>(),
        ),
  );
}
