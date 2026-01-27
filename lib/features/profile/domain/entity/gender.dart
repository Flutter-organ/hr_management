enum Gender {
  male,
  female;

  static Gender fromString(String value) {
    return Gender.values.firstWhere(
          (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => Gender.male,
    );
  }
}