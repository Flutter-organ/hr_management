import 'package:get_it/get_it.dart';
import 'package:hr_management/features/auth/data/repository_imp/auth_repository_imp.dart';
import 'package:hr_management/features/auth/domain/repository/auth_repository.dart';
import 'package:hr_management/features/auth/domain/use_cases/load_identifier_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hr_management/features/auth/data/data_source/remote/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:hr_management/features/auth/data/data_source/remote/auth_remote_data_source/auth_remote_data_source_imp.dart';
import 'package:hr_management/features/auth/domain/use_cases/login_use_case.dart';
import 'package:hr_management/features/auth/presentation/login_feature/cubit/login_cubit.dart';
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
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImp(
      secureStorageService: sl<SecureStorageService>(),
      preferencesService: sl<PreferencesService>(),
    ),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);

  sl.registerLazySingleton<PreferencesService>(
    () => SharedPreferencesServiceImpl(sl<SharedPreferences>()),
  );

  sl.registerLazySingleton<DioClient>(
    () => DioClient(sl<AuthLocalDataSource>()),
  );

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImp(sl<DioClient>()),
  );
}

Future<void> _initAuth() async {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImp(
      localDataSource: sl<AuthLocalDataSource>(),
      remoteDatasource: sl<AuthRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()));

  sl.registerLazySingleton(() => LoadIdentifierUseCase(sl<AuthRepository>()));

  sl.registerFactory(
    () => LoginCubit(sl<LoginUseCase>(), sl<LoadIdentifierUseCase>()),
  );
}
