class User {
  final int? id;
  final String? email;
  final bool? isActive;
  final String? role;

  const User({
    required this.id,
    required this.email,
    required this.isActive,
    required this.role,
  });
}