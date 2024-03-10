import 'package:red_events_mobile_app_defult/feature/manager/hr/view/hr_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/hr_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin HrMixin on BaseState<HrView> {
  late final HrBloc hrBloc;

  @override
  void initState() {
    hrBloc = HrBloc(
      editMode: widget.isEditMode,
      personnelList: widget.personnelList,
      groupValue: widget.groupValue,
    );

    super.initState();
  }

  void changeIsCheckPersonnel({required int index, required bool value}) {
    final tempPersonnel =
        hrBloc.state.personnelList[index].copyWith(isCheck: value);
    // ignore: prefer_final_locals
    hrBloc.state.personnelList
      ..removeAt(index)
      ..insert(index, tempPersonnel);

    hrBloc.changeList(hrBloc.state.personnelList);
  }
}
