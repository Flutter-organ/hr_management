import '../../../../domain/enitites/User.dart';

class UserDto {
  final int id;
  final String? email;
  final String? phone;
  final bool isActive;
  final String? role;

  const UserDto({
    required this.id,
    this.email,
    this.phone,
    this.isActive = false,
    this.role,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] as int? ?? 0,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      isActive: _parseIsActive(json['is_active']),
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

  static bool _parseIsActive(dynamic value) {
    if (value == null) return false;

    if (value is bool) {
      return value;

    }

    if (value is int) {
      return value == 1 ? true : false;
    }

    if (value is String) {
      if (value.toLowerCase() == 'true') return true;
      if (value.toLowerCase() == 'false') return false;
      return false;
    }
    return false;
  }
}