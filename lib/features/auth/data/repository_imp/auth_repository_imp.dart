import '../../domain/repository/auth_repository.dart';
import '../data_source/local/auth_local_data_source.dart';

class AuthRepositoryImp implements AuthRepository{
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImp({required AuthLocalDataSource localDataSource})
      : _localDataSource = localDataSource;

  @override
  Future<String?> getToken() async {
    return await _localDataSource.getToken();
  }

  @override
  Future<void> saveToken(String token) async {
    await _localDataSource.saveToken(token);
  }

  @override
  Future<void> clearToken() async {
    await _localDataSource.clearToken();
  }

  @override
  Future<bool> hasToken() async {
    return await _localDataSource.hasToken();
  }

}