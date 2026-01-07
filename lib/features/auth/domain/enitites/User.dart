import 'package:equatable/equatable.dart';

class User extends Equatable {
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

  @override
  List<Object?> get props => [id, email, isActive, role];
}
