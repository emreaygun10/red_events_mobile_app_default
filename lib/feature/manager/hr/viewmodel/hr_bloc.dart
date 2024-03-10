import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/state/hr_state.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/peronnel_model.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

class HrBloc extends BaseCubit<HrState> {
  HrBloc({
    required this.editMode,
    required this.personnelList,
    required this.groupValue,
  }) : super(
          HrState(
            isEditMode: editMode,
            personnelList: personnelList,
            groupValue: groupValue,
            buttonCounter: 0,
          ),
        );

  final bool editMode;
  final List<PersonnelModel> personnelList;
  final int groupValue;
  final List<PersonnelModel> tempSelectedList = [];

  void changeList(List<PersonnelModel> list) {
    emit(state.copyWith(personnelList: list));
  }

  /// bottom sheet actions started
  void bottomSheetActions(int? groupValue) {
    emit(
      state.copyWith(
        isEditMode: true,
        groupValue: groupValue,
      ),
    );
  }

  void addPersonnelSelectedList(PersonnelModel personnel) {
    tempSelectedList.add(personnel);

    emit(
      state.copyWith(
        selectedPersonnelList: tempSelectedList,
        buttonCounter: tempSelectedList.length,
      ),
    );
  }
}
