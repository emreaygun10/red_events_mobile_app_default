import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/state/profile_request_selection_manager_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

class ProfileRequestSelectionManagerBloc
    extends BaseCubit<ProfileRequestSelectionManagerState> {
  ///
  ProfileRequestSelectionManagerBloc({required List<String> managerList})
      : super(
          ProfileRequestSelectionManagerState(
            managerList: managerList,
          ),
        );

  /// Fill Manager List
  bool addManagerList(String manager) {
    // ignore: prefer_final_locals
    var tempList = <String>[];
    if (state.checkBoxList.length < 2) {
      for (final name in state.checkBoxList) {
        tempList.add(name);
      }
      tempList.add(manager);
      emit(state.copyWith(checkBoxList: tempList));
      return true;
    } else {
      return false;
    }
  }

  /// Remove manager list
  void removeManagerList(String manager) {
    // ignore: prefer_final_locals
    var tempList = <String>[];
    for (final name in state.checkBoxList) {
      tempList.add(name);
    }
    tempList.remove(manager);
    emit(state.copyWith(checkBoxList: tempList));
  }
}
