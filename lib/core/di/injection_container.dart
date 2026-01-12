import 'package:get_it/get_it.dart';
import 'package:hr_management/core/cache/shared_preferences_service.dart';
import 'package:hr_management/features/auth/data/data_source/local/onboarding_local_data_source%20.dart';
import 'package:hr_management/features/auth/data/data_source/local/onboarding_local_data_source_impl.dart';
import 'package:hr_management/features/auth/data/repository_imp/on_boarding_imp.dart';
import 'package:hr_management/features/auth/domain/repository/on_boarding_repository.dart';
import 'package:hr_management/features/auth/domain/use_cases/on_boarding_use_case.dart';
import 'package:hr_management/features/presentation/on_boarding_feat/logic/cubit/on_boarding_cubit.dart';
import 'package:shared_preferences/src/shared_preferences_legacy.dart';
import '../../features/auth/data/data_source/local/auth_local_data_source.dart';
import '../../features/auth/data/data_source/local/auth_local_data_source_imp.dart';
import '../../features/auth/data/repository_imp/auth_repository_imp.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../cache/secure_storage_data_source.dart';
import '../network/dio_client.dart';

final sl = GetIt.instance;
Future<void> setupDependencies(SharedPreferences sharedPrefs) async {
  await _initCore(sharedPrefs);
  await _initAuth();
  await _initOnboarding();
}

Future<void> _initCore(SharedPreferences sharedPrefs) async {
  sl.registerLazySingleton<PreferencesService>(
    () => SharedPreferencesServiceImpl(sharedPrefs),
  );
  sl.registerLazySingleton<SecureStorageService>(
    () => SecureStorageServiceImpl(),
  );
  sl.registerLazySingleton<DioClient>(
    () => DioClient(sl<AuthLocalDataSource>()),
  );
}

Future<void> _initAuth() async {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImp(localDataSource: sl<AuthLocalDataSource>()),
  );
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImp(
      secureStorageService: sl<SecureStorageService>(),
    ),
  );
}

Future<void> _initOnboarding() async {
  sl.registerLazySingleton<OnboardingLocalDataSource>(
    () => OnboardingLocalDataSourceImpl(sl<PreferencesService>()),
  );
  sl.registerLazySingleton<OnboardingRepository>(
    () => OnBoardingImp(localDataSource: sl<OnboardingLocalDataSource>()),
  );
  sl.registerLazySingleton(
    () => CompleteOnboardingUseCase(sl<OnboardingRepository>()),
  );
  sl.registerFactory(() => OnboardingCubit(sl<CompleteOnboardingUseCase>()));
}
