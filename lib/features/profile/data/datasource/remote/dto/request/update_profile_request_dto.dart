class UpdateProfileRequestDto {
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? address;

  const UpdateProfileRequestDto({
    this.firstName,
    this.lastName,
    this.phone,
    this.address,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (firstName != null && firstName!.isNotEmpty) {
      data['first_name'] = firstName;
    }
    if (lastName != null && lastName!.isNotEmpty) {
      data['last_name'] = lastName;
    }
    if (phone != null && phone!.isNotEmpty) {
      data['phone'] = phone;
    }
    if (address != null && address!.isNotEmpty) {
      data['address'] = address;
    }

    return data;
  }

  bool get hasData =>
      (firstName?.isNotEmpty ?? false) ||
          (lastName?.isNotEmpty ?? false) ||
          (phone?.isNotEmpty ?? false) ||
          (address?.isNotEmpty ?? false);
}