class UpdateProfileRequestDto {
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String gender;
  final String address;
  final String? phone;

  const UpdateProfileRequestDto({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.gender,
    required this.address,
    this.phone,
  });

  Map<String, dynamic> toJson() {
    final data = {
      'first_name': firstName,
      'last_name': lastName,
      'date_of_birth': dateOfBirth,
      'gender': gender,
      'address': address,
    };

    if (phone != null) {
      data['phone'] = phone!;
    }

    return data;
  }
}