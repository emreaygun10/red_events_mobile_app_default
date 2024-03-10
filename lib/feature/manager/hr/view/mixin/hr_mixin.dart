import 'package:easy_localization/easy_localization.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/view/hr_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/hr_bloc.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/manager_enum.dart';

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

  String selectBottomButtonText(HrBottomSheetEnum hrBottomSheetEnum) {
    switch (hrBottomSheetEnum) {
      case HrBottomSheetEnum.pushNotification:
        return LocaleKeys.manager_bottom_shhet_push_notification_button.tr(
          args: [
            hrBloc.state.buttonCounter.toString(),
          ],
        );
      default:
        return LocaleKeys.manager_bottom_shhet_push_notification_continue.tr(
          args: [
            hrBloc.state.buttonCounter.toString(),
          ],
        );
    }
  }
}
