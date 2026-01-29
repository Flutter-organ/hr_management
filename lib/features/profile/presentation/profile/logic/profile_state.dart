import 'package:equatable/equatable.dart';

import '../../../domain/entity/employee_profile.dart';

class ProfileState extends Equatable {
  final EmployeeProfile? profile;
  final bool isLoading;
  final bool isProfileNotCompleted;
  final String? error;
  final bool isUploadingImage;
  final String? uploadImageError;

  const ProfileState({
    this.profile,
    this.isLoading = false,
    this.isProfileNotCompleted = false,
    this.error,
    this.isUploadingImage = false,
    this.uploadImageError,
  });

  ProfileState copyWith({
    EmployeeProfile? profile,
    bool? isLoading,
    bool? isProfileNotCompleted,
    String? error,
    bool? isUploadingImage,
    String? uploadImageError,
    bool clearError = false,
    bool clearUploadImageError = false,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
      isLoading: isLoading ?? this.isLoading,
      isProfileNotCompleted: isProfileNotCompleted ?? this.isProfileNotCompleted,
      error: clearError ? null : (error ?? this.error),
      isUploadingImage: isUploadingImage ?? this.isUploadingImage,
      uploadImageError: clearUploadImageError
          ? null
          : (uploadImageError ?? this.uploadImageError),
    );
  }

  @override
  List<Object?> get props => [
    profile,
    isLoading,
    isProfileNotCompleted,
    error,
    isUploadingImage,
    uploadImageError,
  ];
}