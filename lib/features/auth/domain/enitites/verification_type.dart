enum VerificationType {
  registration('registration'),
  forgetPassword('forget_password');

  final String value;

  const VerificationType(this.value);

  static VerificationType fromString(String value) {
    return VerificationType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => VerificationType.registration,
    );
  }
}
