import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/state/profile_request_payroll.state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// Profile Request Report state management class
class ProfileRequestPayrollBloc extends BaseCubit<ProfileRequestPayrollState> {
  ///
  ProfileRequestPayrollBloc({required List<String> managerList})
      : super(
          ProfileRequestPayrollState(
            isLoading: false,
            managerList: managerList,
            isButtonEnable: false,
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

  ///button clickable changer
  void changeButtonEnable({required bool isEnable}) {
    emit(
      state.copyWith(isButtonEnable: isEnable),
    );
  }

  /// change value explanation
  void valueChangedExplanation(String? explanation) {
    //print(explanation);
    emit(
      state.copyWith(
        explanation: explanation,
      ),
    );
  }

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
