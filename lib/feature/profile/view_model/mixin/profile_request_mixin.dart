import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_request_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/cubit/profile_request_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin ProfileRequestMixin on BaseState<ProfileRequestView> {
  late final ProfileRequestBloc _profileRequestBloc;

  /// View Model Getter
  ProfileRequestBloc get profileRequestBloc => _profileRequestBloc;

  @override
  void initState() {
    _profileRequestBloc = ProfileRequestBloc();
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

  /// Select chip background color
  Color? selectChipBackgroundColor(int index) {
    switch (index) {
      case 0:
        return ColorName.orangeBase;
      case 1:
        return ColorName.redBase;
      default:
        return ColorName.greenBase;
    }
  }

  /// Select chip background color
  int? selectText(int index) {
    switch (index) {
      case 0:
        return profileRequestBloc.state.waitingChipCounter;
      case 1:
        return profileRequestBloc.state.rejectedChipCounter;
      default:
        return profileRequestBloc.state.acceptedChipCounter;
    }
  }
}
