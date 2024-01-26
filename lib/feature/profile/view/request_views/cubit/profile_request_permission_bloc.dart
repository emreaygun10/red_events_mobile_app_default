import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/state/profile_request_permission_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// Profile Education state management class
class ProfileRequestPermissionBloc
    extends BaseCubit<ProfileRequestPermissionState> {
  ///
  ProfileRequestPermissionBloc()
      : super(
          const ProfileRequestPermissionState(
            isLoading: false,
            buttonIsEnabled: false,
            sumDate: 0,
          ),
        );

  /// change value obscure
  void changeSumDate(int value) {
    emit(state.copyWith(sumDate: value));
  }

  /// choose permission type
  void selectPermissionType(int value) {
    emit(state.copyWith(permissionType: value));
  }

  void changeStartDate(DateTime date) {
    emit(state.copyWith(startDate: date));
  }

  void changeEndDate(DateTime date) {
    emit(state.copyWith(endDate: date));
  }

  void changeButtonEnable({required bool value}) {
    emit(state.copyWith(buttonIsEnabled: value));
  }
}
