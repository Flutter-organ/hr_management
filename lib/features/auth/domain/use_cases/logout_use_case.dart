import 'package:fpdart/fpdart.dart';
import '../../../../core/data/cache/cache_manager.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../repository/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository _authRepository;
  final CacheManager _cacheManager;

  const LogoutUseCase({
    required AuthRepository authRepository,
    required CacheManager cacheManager,
  })  : _authRepository = authRepository,
        _cacheManager = cacheManager;

  Future<Either<Failure, Unit>> call() async {
    final result = await _authRepository.clearToken();

    if (result.isRight()) {
      try {
        await _cacheManager.clearAllCache();
      } catch (_) {
        // Ignore cache clearing errors
      }
    }

    return result;
  }
}