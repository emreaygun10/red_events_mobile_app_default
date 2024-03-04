import 'package:red_events_mobile_app_defult/feature/manager/view_model/state/manager_bottom_navigation_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

class ManagerBottomNavigationBloc
    extends BaseCubit<ManagerBottomNavigationState> {
  ManagerBottomNavigationBloc()
      : super(
          const ManagerBottomNavigationState(
            activePage: 0,
          ),
        );

  void changeActivePage(int index) {
    emit(state.copyWith(activePage: index));
  }
}
