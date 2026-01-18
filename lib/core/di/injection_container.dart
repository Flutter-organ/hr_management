import 'package:get_it/get_it.dart';
import 'package:hr_management/features/auth/domain/repository/auth_repository.dart';
import 'package:hr_management/features/auth/domain/use_cases/load_identifier_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hr_management/features/auth/domain/use_cases/login_use_case.dart';
import 'package:hr_management/features/auth/presentation/logic/login/login_cubit.dart';
import '../../features/auth/data/data_source/local/auth_local_data_source.dart';
import '../../features/auth/data/data_source/local/auth_local_data_source_imp.dart';
import '../../features/auth/data/data_source/remote/AuthRemoteDataSource.dart';
import '../../features/auth/data/data_source/remote/AuthRemoteDataSourceImpl.dart';
import '../../features/auth/data/repository_imp/auth_repository_imp.dart';
import '../../features/auth/domain/usecases/ForgotPasswordUseCase.dart';
import '../../features/auth/domain/usecases/ResetPasswordUseCase.dart';
import '../../features/auth/presentation/logic/forget_password/forgot_password_cubit.dart';
import '../../features/auth/presentation/logic/reset_password/reset_password_cubit.dart';
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
  //data
  sl.registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSourceImp(
      secureStorageService: sl<SecureStorageService>(),
          preferencesService: sl<PreferencesService>() ,
    ),
  );
  sl.registerLazySingleton<DioClient>(
    () => DioClient(sl<AuthLocalDataSource>()),
  );
  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImp(dioClient: sl<DioClient>()),
  );
  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImp(
      localDataSource: sl<AuthLocalDataSource>(),
      remoteDataSource: sl<AuthRemoteDataSource>(),
    ),
  );

  //domain
  sl.registerLazySingleton<ForgotPasswordUseCase>(
        () => ForgotPasswordUseCase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<ResetPasswordUseCase>(
        () => ResetPasswordUseCase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => LoadIdentifierUseCase(sl<AuthRepository>()));

  //presentation
  sl.registerFactory<ForgotPasswordCubit>(
        () => ForgotPasswordCubit(sl<ForgotPasswordUseCase>()),
  );
  sl.registerFactory<ResetPasswordCubit>(
        () => ResetPasswordCubit(sl<ResetPasswordUseCase>()),
  );
  sl.registerFactory(() => LoginCubit(sl<LoginUseCase>(), sl<LoadIdentifierUseCase>()),
  );

}