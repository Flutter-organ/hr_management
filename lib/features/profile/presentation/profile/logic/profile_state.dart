import 'package:equatable/equatable.dart';

import '../../../domain/entity/employee_profile.dart';
import '../../../domain/entity/gender.dart';

class ProfileState extends Equatable {
  final EmployeeProfile? profile;
  final String? userIdentifier;
  final bool isLoading;
  final bool isProfileNotCompleted;
  final String? error;

  final bool isUploadingImage;
  final String? uploadImageError;

  final String firstName;
  final String lastName;
  final DateTime? dateOfBirth;
  final Gender selectedGender;
  final String nationalId;
  final String address;

  final String? firstNameError;
  final String? lastNameError;
  final String? dateOfBirthError;
  final String? nationalIdError;
  final String? addressError;

  const ProfileState({
    this.profile,
    this.userIdentifier,
    this.isLoading = false,
    this.isProfileNotCompleted = false,
    this.error,
    this.isUploadingImage = false,
    this.uploadImageError,
    this.firstName = '',
    this.lastName = '',
    this.dateOfBirth,
    this.selectedGender = Gender.male,
    this.nationalId = '',
    this.address = '',
    this.firstNameError,
    this.lastNameError,
    this.dateOfBirthError,
    this.nationalIdError,
    this.addressError,
  });

  bool get isFormValid =>
      firstName.trim().isNotEmpty &&
          lastName.trim().isNotEmpty &&
          dateOfBirth != null &&
          nationalId.trim().isNotEmpty &&
          address.trim().isNotEmpty;

  ProfileState copyWith({
    EmployeeProfile? profile,
    String? userIdentifier,
    bool? isLoading,
    bool? isProfileNotCompleted,
    String? error,
    bool? isUploadingImage,
    String? uploadImageError,
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    Gender? selectedGender,
    String? nationalId,
    String? address,
    String? firstNameError,
    String? lastNameError,
    String? dateOfBirthError,
    String? nationalIdError,
    String? addressError,
    bool clearError = false,
    bool clearUploadImageError = false,
    bool clearFirstNameError = false,
    bool clearLastNameError = false,
    bool clearDateOfBirthError = false,
    bool clearNationalIdError = false,
    bool clearAddressError = false,
    bool clearAllFormErrors = false,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
      userIdentifier: userIdentifier ?? this.userIdentifier,
      isLoading: isLoading ?? this.isLoading,
      isProfileNotCompleted: isProfileNotCompleted ?? this.isProfileNotCompleted,
      error: clearError ? null : (error ?? this.error),
      isUploadingImage: isUploadingImage ?? this.isUploadingImage,
      uploadImageError: clearUploadImageError ? null : (uploadImageError ?? this.uploadImageError),
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      selectedGender: selectedGender ?? this.selectedGender,
      nationalId: nationalId ?? this.nationalId,
      address: address ?? this.address,
      firstNameError: (clearFirstNameError || clearAllFormErrors) ? null : (firstNameError ?? this.firstNameError),
      lastNameError: (clearLastNameError || clearAllFormErrors) ? null : (lastNameError ?? this.lastNameError),
      dateOfBirthError: (clearDateOfBirthError || clearAllFormErrors) ? null : (dateOfBirthError ?? this.dateOfBirthError),
      nationalIdError: (clearNationalIdError || clearAllFormErrors) ? null : (nationalIdError ?? this.nationalIdError),
      addressError: (clearAddressError || clearAllFormErrors) ? null : (addressError ?? this.addressError),
    );
  }

  @override
  List<Object?> get props => [
    profile,
    userIdentifier,
    isLoading,
    isProfileNotCompleted,
    error,
    isUploadingImage,
    uploadImageError,
    firstName,
    lastName,
    dateOfBirth,
    selectedGender,
    nationalId,
    address,
    firstNameError,
    lastNameError,
    dateOfBirthError,
    nationalIdError,
    addressError,
  ];
}