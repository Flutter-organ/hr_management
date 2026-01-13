import '../../../../domain/enitites/User.dart';

class UserDto {
  final int id;
  final String? email;
  final String? phone;
  final int isActive;
  final String? role;

  const UserDto({
    required this.id,
    this.email,
    this.phone,
    this.isActive = 0,
    this.role,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] as int,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      isActive: json['is_active'] as int? ?? 0,
      role: json['role'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'is_active': isActive,
      'role': role,
    };
  }

  User toDomain() {
    return User(
      id: id,
      email: email,
      phone: phone,
      isActive: isActive,
      role: role,
    );
  }
}