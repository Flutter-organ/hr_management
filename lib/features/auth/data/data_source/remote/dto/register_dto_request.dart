import 'dart:convert';

RegisterDtoRequest registerDtoRequestFromJson(String str) => RegisterDtoRequest.fromJson(json.decode(str));

String registerDtoRequestToJson(RegisterDtoRequest data) => json.encode(data.toJson());

class RegisterDtoRequest {
    RegisterDtoRequest({
        required this.password,
        required this.passwordConfirmation,
        required this.phone,
        required this.loginType,
        required this.email,
    });

    String password;
    String passwordConfirmation;
    String phone;
    String loginType;
    String email;

    factory RegisterDtoRequest.fromJson(Map<dynamic, dynamic> json) => RegisterDtoRequest(
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
        phone: json["phone"],
        loginType: json["login_type"],
        email: json["email"],
    );

    Map<dynamic, dynamic> toJson() => {
        "password": password,
        "password_confirmation": passwordConfirmation,
        "phone": phone,
        "login_type": loginType,
        "email": email,
    };
}
