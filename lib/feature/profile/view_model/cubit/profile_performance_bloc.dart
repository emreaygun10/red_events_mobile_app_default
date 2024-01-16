import 'package:red_events_mobile_app_defult/feature/profile/view_model/state/profile_performance_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// Profile Education state management class
class ProfilePerformanceBloc extends BaseCubit<ProfilePerformanceState> {
  ///
  ProfilePerformanceBloc()
      : super(
          const ProfilePerformanceState(
            isLoading: false,
            chipIndex: 0,
          ),
        );

  /// change value obscure
  void changeChipIndex(int index) {
    emit(state.copyWith(chipIndex: index));
  }

  ///change response data
  void changeList(String data) {
    emit(state.copyWith(data: data));
  }
}
