enum LoginType {
  email('email'),
  phone('phone');

  final String value;

  const LoginType(this.value);

  static LoginType fromString(String value) {
    return LoginType.values.firstWhere(
          (type) => type.value == value,
      orElse: () => LoginType.email,
    );
  }
}