import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/state/profile_request_leave_view.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// Profile Request Report state management class
class ProfileRequestLeaveBloc extends BaseCubit<ProfileRequestLeaveState> {
  ///
  ProfileRequestLeaveBloc()
      : super(
          const ProfileRequestLeaveState(
            isLoading: false,
            groupIndex: 0,
          ),
        );

  /// change value group index
  void changeGroupIndex(int value) {
    emit(
      state.copyWith(
        groupIndex: value,
      ),
    );
  }

  /// change value leave reason
  void changeLeaveReason(String? leaveReason) {
    emit(
      state.copyWith(
        leaveReason: leaveReason,
      ),
    );
  }
}
