import 'package:get_it/get_it.dart';
import 'package:hr_management/features/auth/domain/usecase/RegisterUseCase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/data/data_source/local/auth_local_data_source.dart';
import '../../features/auth/data/data_source/local/auth_local_data_source_imp.dart';
import '../../features/auth/data/data_source/remote/AuthRemoteDataSource.dart';
import '../../features/auth/data/data_source/remote/AuthRemoteDataSourceImp.dart';
import '../../features/auth/data/repository_imp/auth_repository_imp.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../../features/auth/domain/usecase/OtpUseCase.dart';
import '../../features/auth/presentation/sign_up_screan/logic/sign_up_cubit.dart';
import '../../features/auth/presentation/verify_otp/logic/verify_otp_cubit.dart';
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

  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(sl<DioClient>()),
  );

  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImp(
        localDataSource: sl<AuthLocalDataSource>(),
        remoteDataSource: sl<AuthRemoteDataSource>()
    ),
  );
  sl.registerLazySingleton<RegisterUseCase>(
        () => RegisterUseCase(
      sl<AuthRepository>(),
    ),
  );
  sl.registerLazySingleton<verifyOTPUseCase>(
        () => verifyOTPUseCase(
      sl<AuthRepository>(),
    ),
  );
  sl.registerFactory<SignUpCubit>(
        () => SignUpCubit(
      sl<RegisterUseCase>()
        ),
  );
  sl.registerFactory<VerifyOtpCubit>(
          () => VerifyOtpCubit(
        sl<verifyOTPUseCase>(),
      )
  );

}

