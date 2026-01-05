import 'package:flutter/material.dart';

import '../../../../../core/cashe/secure_storage_data_source.dart';
import '../../../../../core/network/api_constants.dart';
import 'auth_local_data_source.dart';

class AuthLocalDataSourceImp implements AuthLocalDataSource {
  final SecureStorageService _secureStorageService;

  const AuthLocalDataSourceImp ({required SecureStorageService secureStorageService})
      : _secureStorageService = secureStorageService;

  Future<String?> getToken() async {
    return await _secureStorageService.read(key:ApiConstants.token_key);
  }

  Future<void> saveToken(String token) async {
    return await _secureStorageService.write(key: ApiConstants.token_key, value: token);
  }

  Future<void> clearToken() async {
    return await _secureStorageService.delete(key: ApiConstants.token_key);
  }

}