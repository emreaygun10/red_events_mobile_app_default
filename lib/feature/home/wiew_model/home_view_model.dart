// ignore_for_file: public_member_api_docs

import 'package:red_events_mobile_app_defult/feature/home/wiew_model/state/home_view_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

class HomeViewModel extends BaseCubit<HomeState> {
  HomeViewModel()
      : super(
          const HomeState(
            isLoading: false,
            activeDayIndex: 0,
            isAccepted: false,
          ),
        );

  void changeIsAccepted() {
    emit(state.copyWith(isAccepted: !state.isAccepted));
  }
}
