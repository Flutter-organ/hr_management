class UserModel {
  final int id;
  final String email;
  final bool isActive;
  final String role;

  const UserModel({
    required this.id,
    required this.email,
    required this.isActive,
    required this.role,
  });

  UserModel copyWith({
    int? id,
    String? email,
    bool? isActive,
    String? role,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      isActive: isActive ?? this.isActive,
      role: role ?? this.role,
    );
  }
}