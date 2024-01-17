import 'package:red_events_mobile_app_defult/feature/profile/view_model/state/profil_request_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// Profile Request state management class
class ProfileRequestBloc extends BaseCubit<ProfileRequestState> {
  ///
  ProfileRequestBloc()
      : super(
          const ProfileRequestState(
            isLoading: false,
            chipIndex: 0,
            waitingChipCounter: 4,
          ),
        );

  /// change value obscure
  void changeChipIndex(int index) {
    emit(state.copyWith(chipIndex: index));
  }

  ///change response data
  void changeList(String data) {
    emit(state.copyWith(requestList: [data]));
  }
}
