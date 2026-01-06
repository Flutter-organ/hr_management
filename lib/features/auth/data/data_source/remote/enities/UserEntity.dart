import '../../../../domain/models/UserModel.dart';

class UserEntity {
  final int id;
  final String email;
  final bool isActive;
  final String role;

  UserEntity({
    required this.id,
    required this.email,
    required this.isActive,
    required this.role,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'] as int,
      email: json['email'] as String,
      isActive: json['is_active'] as bool,
      role: json['role'] as String,
    );
  }
}