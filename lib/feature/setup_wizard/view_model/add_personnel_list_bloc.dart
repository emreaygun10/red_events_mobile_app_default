import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/peronnel_model.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/state/add_personnel_list_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// Add personnel list state management class
class AddPersonnelListBloc extends BaseCubit<AddPersonnelListState> {
  ///
  AddPersonnelListBloc()
      : super(
          const AddPersonnelListState(
            personnelList: [],
            isDisable: true,
          ),
        );

  void changeModelList(List<PersonnelModel> list) {
    emit(state.copyWith(personnelList: list));
  }

  void changeIsDisable({required bool value}) {
    emit(state.copyWith(isDisable: value));
  }
}
