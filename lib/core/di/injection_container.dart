import 'package:get_it/get_it.dart';
import 'package:hr_management/features/auth/data/data_source/local/onboarding_local_data_source%20.dart';
import 'package:hr_management/features/auth/data/data_source/local/onboarding_local_data_source_impl.dart';
import 'package:hr_management/features/auth/data/repository_imp/on_boarding_repository_imp.dart';
import 'package:hr_management/features/auth/domain/repository/on_boarding_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/data/data_source/local/auth_local_data_source.dart';
import '../../features/auth/data/data_source/local/auth_local_data_source_imp.dart';
import '../../features/auth/domain/use_cases/check_onboarding_status_use_case.dart';
import '../../features/auth/domain/use_cases/complete_onboarding_use_case.dart';
import '../../features/auth/presentation/on_boarding/logic/cubit/on_boarding_cubit.dart';
import '../cache/secure_storage_data_source.dart';
import '../cache/shared_preferences_service.dart';
import '../network/dio_client.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  await _initCore();
  await _initAuth();
  await _initOnboarding();
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

Future<void> _initOnboarding() async {
  sl.registerLazySingleton<OnboardingLocalDataSource>(
        () => OnboardingLocalDataSourceImpl(sl<PreferencesService>()),
  );

  sl.registerLazySingleton<OnboardingRepository>(
        () => OnboardingRepositoryImpl(sl<OnboardingLocalDataSource>()),
  );

  sl.registerLazySingleton<CompleteOnboardingUseCase>(
        () => CompleteOnboardingUseCase(sl<OnboardingRepository>()),
  );

  sl.registerLazySingleton<CheckOnboardingStatusUseCase>(
        () => CheckOnboardingStatusUseCase(sl<OnboardingRepository>()),
  );

  sl.registerFactory<OnboardingCubit>(
        () => OnboardingCubit(
      completeOnboardingUseCase: sl<CompleteOnboardingUseCase>(),
      checkOnboardingStatusUseCase: sl<CheckOnboardingStatusUseCase>(),
    ),
  );
}
