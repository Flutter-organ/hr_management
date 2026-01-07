import '../../../../domain/models/User.dart';

class UserDto {
  final int? id;
  final String? email;
  final bool? isActive;
  final String? role;

  UserDto({
    required this.id,
    required this.email,
    required this.isActive,
    required this.role,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] as int,
      email: json['email'] as String,
      isActive: json['is_active'] as bool,
      role: json['role'] as String,
    );
  }
}