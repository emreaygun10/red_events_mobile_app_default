import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_show_modal_bottom_sheet.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/cubit/bottom_sheet_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin BottomSheetMixin on BaseState<CustomShowModalBottomSheet> {
  late final BottomSheetBloc _bottomSheetBloc;

  /// View Model Getter
  BottomSheetBloc get bottomSheetBloc => _bottomSheetBloc;

  @override
  void initState() {
    _bottomSheetBloc = BottomSheetBloc();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Hide Keyboard
  void hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
