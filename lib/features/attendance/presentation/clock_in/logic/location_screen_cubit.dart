import 'package:hr_management/core/presentation/base_viewmodel/base_cubit.dart';
import 'package:hr_management/features/attendance/domain/use_case/getDistanceBetweenLocationUseCase.dart';
import 'package:hr_management/features/attendance/domain/use_case/getOfficeLocationUseCase.dart';

import '../../../domain/enitity/UserLocation.dart';
import '../../../domain/use_case/GetCurrentLocationUseCase.dart';
import '../../../domain/use_case/getUserInfoUseCase.dart';
import 'location_screen_state.dart';

class ClockInLocationCubit extends BaseCubit<ClockInLocationState> {
  final GetCurrentLocationUseCase _getCurrentLocation;
  final Getdistancebetweenlocationusecase _getdistancebetweenlocationusecase;
  final GetUserInfoUseCase _getUserInfo;
  final GetOfficeLocationUseCase _getOfficeLocation;


  ClockInLocationCubit({
    required GetCurrentLocationUseCase getCurrentLocation,
    required Getdistancebetweenlocationusecase getDistanceBetweenLocationUseCase,
    required GetUserInfoUseCase getUserInfo,
    required GetOfficeLocationUseCase getOfficeLocation,
    double allowedRadius = 120000,
  })  :_getOfficeLocation = getOfficeLocation,
        _getCurrentLocation = getCurrentLocation,
        _getdistancebetweenlocationusecase = getDistanceBetweenLocationUseCase,
        _getUserInfo = getUserInfo,
        super(
          ClockInLocationState(
        allowedRadius: allowedRadius
      )) {
    _init();
  }


  Future<void> _init() async {
    updateState((s) => s.copyWith(status: LocationStatus.loading));
    await _loadOfficeLocation();
    await _loadUserData();
    await loadUserLocation();

  }

  Future<void> loadUserLocation() async {
    execute(
      onLoading: () =>
          updateState((s) => state.copyWith(status: LocationStatus.loaded)),
      call: () => _getCurrentLocation(),
      onSuccess: (location) {
        calculateDistance(location, state.officeLocation!);
        updateState((s) => state.copyWith(userLocation: location));
      },
      onError: (e) =>
          updateState((s) => state.copyWith(status: LocationStatus.error)),
    );
  }

  Future<void> _loadUserData() async {
    execute(
      onLoading: () {},
      call: () => _getUserInfo(),
      onSuccess: (user) {
        updateState(
              (s) => s.copyWith(
            userName: user.firstname,
            userImageUrl: user.imageUser,
          ),
        );
      },
      onError: (e) => updateState(
            (s) => s.copyWith(errorMessage: e.toString()),
      ),
    );
  }

  Future<void> calculateDistance(Location p1, Location p2) async {
    execute(
      onLoading: () {},
      call: () => _getdistancebetweenlocationusecase(p1, p2),
      onSuccess: (distance) {
        final isInside = distance <= state.allowedRadius;

        updateState(
              (s) => s.copyWith(
            distanceFromOffice: distance,
            isInClockInArea: isInside,
            status: LocationStatus.loaded,
          ),
        );
      },
      onError: (e) => updateState(
            (s) => s.copyWith(
          status: LocationStatus.error,
          errorMessage: e.toString(),
        ),
      ),
    );
  }


  Future<void> _loadOfficeLocation() async {
    execute(
      onLoading: () =>
          updateState((s) => state.copyWith(status: LocationStatus.loading)),
      call: () => _getOfficeLocation(),
      onSuccess: (officeLocation) {
        print("officeLocation: $officeLocation");
        updateState((s) => state.copyWith(officeLocation: officeLocation));
      },
      onError: (e) =>
          updateState((s) => state.copyWith(status: LocationStatus.error)),
    );
  }



  void togglePopup() {
    emit(state.copyWith(isPopupVisible: !state.isPopupVisible));
  }

  void showPopup() {
    emit(state.copyWith(isPopupVisible: true));
  }

  void hidePopup() {
    emit(state.copyWith(isPopupVisible: false));
  }

  void clearError() {
    emit(state.copyWith(errorMessage: null));
  }
}
