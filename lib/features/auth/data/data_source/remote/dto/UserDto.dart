import '../../../../domain/enitites/User.dart';

class UserDto {
  final String? email;
  final String? phone;
  final int isActive;
  final String? role;

  const UserDto({
    this.email,
    this.phone,
    this.isActive = 0,
    this.role,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      isActive: json['is_active'] as int? ?? 0,
      role: json['role'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'is_active': isActive,
      'role': role,
    };
  }

  User toDomain() {
    return User(
      email: email,
      phone: phone,
      isActive: isActive,
      role: role,
    );
  }
}