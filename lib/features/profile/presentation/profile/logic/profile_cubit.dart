import 'package:hr_management/features/profile/presentation/profile/logic/profile_state.dart';

import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../domain/usecase/get_profile_usecase.dart';
import '../../../domain/usecase/upload_profile_image_usecase.dart';

class ProfileCubit extends BaseCubit<ProfileState> {
  final GetProfileUseCase _getProfileUseCase;
  final UploadProfileImageUseCase _uploadProfileImageUseCase;

  ProfileCubit({
    required GetProfileUseCase getProfileUseCase,
    required UploadProfileImageUseCase uploadProfileImageUseCase,
  })  : _getProfileUseCase = getProfileUseCase,
        _uploadProfileImageUseCase = uploadProfileImageUseCase,
        super(const ProfileState());

  // ═══════════════════════════════════════════
  // Get Profile
  // ═══════════════════════════════════════════

  Future<void> getProfile() async {
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
        updateState((s) => s.copyWith(
          isLoading: false,
          profile: profile,
          isProfileNotCompleted: false,
        ));
      },
      onError: (error) {
        // Check if profile not completed
        final isNotCompleted = error.message.toLowerCase().contains('not completed');

        updateState((s) => s.copyWith(
          isLoading: false,
          error: error.message,
          isProfileNotCompleted: isNotCompleted,
        ));
      },
    );
  }

  // ═══════════════════════════════════════════
  // Upload Profile Image
  // ═══════════════════════════════════════════

  Future<void> uploadProfileImage(String filePath) async {
    await execute(
      onLoading: () => updateState(
            (s) => s.copyWith(
          isUploadingImage: true,
          clearUploadImageError: true,
        ),
      ),
      call: () => _uploadProfileImageUseCase(filePath),
      onSuccess: (imageUrl) {
        // Update profile with new image URL
        if (state.profile != null) {
          final updatedProfile = state.profile!.copyWith(
            profileImage: imageUrl,
          );
          updateState((s) => s.copyWith(
            isUploadingImage: false,
            profile: updatedProfile,
          ));
        } else {
          updateState((s) => s.copyWith(isUploadingImage: false));
        }
      },
      onError: (error) {
        updateState((s) => s.copyWith(
          isUploadingImage: false,
          uploadImageError: error.message,
        ));
      },
    );
  }

  // ═══════════════════════════════════════════
  // Refresh Profile
  // ═══════════════════════════════════════════

  Future<void> refreshProfile() async {
    await getProfile();
  }

  // ═══════════════════════════════════════════
  // Clear Errors
  // ═══════════════════════════════════════════

  void clearError() {
    updateState((s) => s.copyWith(clearError: true));
  }

  void clearUploadImageError() {
    updateState((s) => s.copyWith(clearUploadImageError: true));
  }
}