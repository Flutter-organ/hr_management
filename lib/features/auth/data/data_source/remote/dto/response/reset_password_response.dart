import 'package:hr_management/features/auth/data/data_source/remote/dto/user_dto.dart';

class ResetPasswordResponse {
  final UserDto? user;
  final String? accessToken;
  final String? tokenType;

  const ResetPasswordResponse({
    required this.user,
    required this.accessToken,
    this.tokenType = 'Bearer',
  });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponse(
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String? ?? 'Bearer',
    );
  }
}
