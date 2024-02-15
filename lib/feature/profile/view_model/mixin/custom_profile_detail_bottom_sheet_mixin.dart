import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_profile_detail_bottom_sheet.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/cubit/custom_profile_detail_bottom_sheet_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/state/custom_profile_detail_bottom_sheet_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin CustomProfileDetailBottomSheetMixin
    on BaseState<CustomProfileDetailBottomSheet> {
  late final CustomProfileDetailBottomSheetBloc
      customProfileDetailBottomSheetBloc;

  @override
  void initState() {
    customProfileDetailBottomSheetBloc = CustomProfileDetailBottomSheetBloc();
    super.initState();
  }

  /// change value element in list
  void changeListOnePieceValue(BottomSheetModel element) {
    final index = customProfileDetailBottomSheetBloc.state.sheetList
        .indexWhere((modal) => modal.id == element.id);
    final tempList = customProfileDetailBottomSheetBloc.state.sheetList;
    tempList[index] = element.copyWith(value: !element.value);
    customProfileDetailBottomSheetBloc.changeList(tempList);
  }
}
