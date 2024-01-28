import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/state/profile_request_report_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// Profile Request Report state management class
class ProfileRequestReportBloc extends BaseCubit<ProfileRequestReportState> {
  ///
  ProfileRequestReportBloc()
      : super(
          const ProfileRequestReportState(
            isLoading: false,
            isLoaded: true,
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

  /// change value isLoaded
  void changeIsLoaded({required bool isLoaded}) {
    emit(
      state.copyWith(
        isLoaded: isLoaded,
      ),
    );
  }
}
