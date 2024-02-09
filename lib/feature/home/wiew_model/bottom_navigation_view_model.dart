// ignore_for_file: public_member_api_docs

import 'package:red_events_mobile_app_defult/feature/home/wiew_model/state/bottom_navigation_bar_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

class BottomNavigationBarViewModel extends BaseCubit<BottomNavigationBarState> {
  BottomNavigationBarViewModel()
      : super(
          const BottomNavigationBarState(
            isLoading: false,
            activePage: 0,
          ),
        );

  void changeActivePage(int index) {
    emit(state.copyWith(activePage: index));
  }
}
