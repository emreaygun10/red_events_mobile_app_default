import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/state/profile_request_other_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

class ProfileRequestOthersBloc extends BaseCubit<ProfileRequestOthersState> {
  ProfileRequestOthersBloc()
      : super(
          const ProfileRequestOthersState(
            isLoading: false,
          ),
        );

  void changeExplanation(String? text) {
    emit(state.copyWith(explanation: text));
  }
}
