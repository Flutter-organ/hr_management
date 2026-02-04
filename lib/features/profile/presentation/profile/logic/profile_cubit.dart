import 'package:easy_localization/easy_localization.dart';
import 'package:hr_management/features/profile/presentation/profile/logic/profile_state.dart';
import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../../auth/domain/use_cases/load_identifier_use_case.dart';
import '../../../domain/entity/gender.dart';
import '../../../domain/usecase/complete_profile_usecase.dart';
import '../../../domain/usecase/get_profile_usecase.dart';
import '../../../domain/usecase/upload_profile_image_usecase.dart';

class ProfileCubit extends BaseCubit<ProfileState> {
  final GetProfileUseCase _getProfileUseCase;
  final UploadProfileImageUseCase _uploadProfileImageUseCase;
  final CompleteProfileUseCase _completeProfileUseCase;
  final LoadIdentifierUseCase _loadIdentifierUseCase;

  ProfileCubit({
    required GetProfileUseCase getProfileUseCase,
    required UploadProfileImageUseCase uploadProfileImageUseCase,
    required LoadIdentifierUseCase loadIdentifierUseCase,
    required CompleteProfileUseCase completeProfileUseCase,
  }) : _getProfileUseCase = getProfileUseCase,
       _uploadProfileImageUseCase = uploadProfileImageUseCase,
       _loadIdentifierUseCase = loadIdentifierUseCase,
       _completeProfileUseCase = completeProfileUseCase,
       super(const ProfileState());


  void onFirstNameChanged(String value) {
    updateState((s) => s.copyWith(
      firstName: value,
      clearFirstNameError: true,
    ));
  }

  void onLastNameChanged(String value) {
    updateState((s) => s.copyWith(
      lastName: value,
      clearLastNameError: true,
    ));
  }

  void onDateOfBirthChanged(DateTime value) {
    updateState((s) => s.copyWith(
      dateOfBirth: value,
      clearDateOfBirthError: true,
    ));
  }

  void onGenderChanged(Gender value) {
    updateState((s) => s.copyWith(selectedGender: value));
  }

  void onNationalIdChanged(String value) {
    updateState((s) => s.copyWith(
      nationalId: value,
      clearNationalIdError: true,
    ));
  }

  void onAddressChanged(String value) {
    updateState((s) => s.copyWith(
      address: value,
      clearAddressError: true,
    ));
  }

  void clearFormErrors() {
    updateState((s) => s.copyWith(clearAllFormErrors: true));
  }

  void resetForm() {
    updateState((s) => s.copyWith(
      firstName: '',
      lastName: '',
      dateOfBirth: null,
      selectedGender: Gender.male,
      nationalId: '',
      address: '',
      clearAllFormErrors: true,
    ));
  }


  Future<void> getProfile() async {
    final cachedIdentifier = await _loadCachedIdentifier();

    await execute(
      onLoading: () => updateState(
            (s) => s.copyWith(
          isLoading: true,
          clearError: true,
          isProfileNotCompleted: false,
        ),
      ),
      call: () => _getProfileUseCase(),
      onSuccess: (profile) {
        updateState(
              (s) => s.copyWith(
            isLoading: false,
            profile: profile,
            isProfileNotCompleted: false,
            userIdentifier: profile.email ?? profile.phone ?? cachedIdentifier,
          ),
        );
      },
      onError: (error) {
        final isNotCompleted = error.message.toLowerCase().contains('not completed');

        updateState(
              (s) => s.copyWith(
            isLoading: false,
            error: error.message,
            isProfileNotCompleted: isNotCompleted,
          ),
        );
      },
    );
  }

  Future<void> submitCompleteProfile() async {
    if (!_validateCompleteProfileForm()) return;

    await execute(
      onLoading: () => updateState(
            (s) => s.copyWith(isLoading: true, clearError: true),
      ),
      call: () => _completeProfileUseCase(
        firstName: state.firstName.trim(),
        lastName: state.lastName.trim(),
        dateOfBirth: state.dateOfBirth!,
        gender: state.selectedGender,
        nationalId: state.nationalId.trim(),
        address: state.address.trim(),
        //departmentId,
        // position,
        // employmentDate,
        // salary,
      ),
      onSuccess: (profile) {
        updateState(
              (s) => s.copyWith(
            isLoading: false,
            profile: profile,
            isProfileNotCompleted: false,
          ),
        );
        resetForm();
      },
      onError: (error) {
        updateState(
              (s) => s.copyWith(
            isLoading: false,
            error: error.message,
          ),
        );
      },
    );
  }


  Future<void> uploadProfileImage(String filePath) async {
    await execute(
      onLoading: () => updateState(
            (s) => s.copyWith(isUploadingImage: true, clearUploadImageError: true),
      ),
      call: () => _uploadProfileImageUseCase(filePath),
      onSuccess: (imageUrl) {
        if (state.profile != null) {
          final updatedProfile = state.profile!.copyWith(profileImage: imageUrl);
          updateState(
                (s) => s.copyWith(isUploadingImage: false, profile: updatedProfile),
          );
        } else {
          updateState((s) => s.copyWith(isUploadingImage: false));
        }
      },
      onError: (error) {
        updateState(
              (s) => s.copyWith(
            isUploadingImage: false,
            uploadImageError: error.message,
          ),
        );
      },
    );
  }

  Future<void> refreshProfile() async {
    await getProfile();
  }

  void clearError() {
    updateState((s) => s.copyWith(clearError: true));
  }

  void clearUploadImageError() {
    updateState((s) => s.copyWith(clearUploadImageError: true));
  }

  Future<String?> _loadCachedIdentifier() async {
    final result = await _loadIdentifierUseCase();
    return result.fold(
          (failure) {
        print('❌ [ProfileCubit] Failed: ${failure.message}');
        return null;
      },
          (identifier) {return identifier;},
    );

  }


  bool _validateCompleteProfileForm() {
    bool isValid = true;

    if (state.firstName.trim().isEmpty) {
      updateState((s) => s.copyWith(firstNameError: 'first_name_required'.tr()));
      isValid = false;
    }

    if (state.lastName.trim().isEmpty) {
      updateState((s) => s.copyWith(lastNameError: 'last_name_required'.tr()));
      isValid = false;
    }

    if (state.dateOfBirth == null) {
      updateState((s) => s.copyWith(dateOfBirthError: 'date_of_birth_required'.tr()));
      isValid = false;
    }

    if (state.nationalId.trim().isEmpty) {
      updateState((s) => s.copyWith(nationalIdError: 'national_id_required'.tr()));
      isValid = false;
    }

    if (state.address.trim().isEmpty) {
      updateState((s) => s.copyWith(addressError: 'address_required'.tr()));
      isValid = false;
    }

    return isValid;
  }

}
