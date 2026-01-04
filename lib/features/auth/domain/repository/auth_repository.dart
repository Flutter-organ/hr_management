import 'package:flutter/material.dart';
abstract class AuthRepository{
  Future<String?> getToken();
  Future<void> saveToken(String token);
  Future<void> clearToken();

}