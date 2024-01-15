import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_education_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/cubit/profile_education_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin ProfileEducationMixin on BaseState<ProfileEducationView> {
  late final ProfileEducationBloc _profileEducationBloc;

  /// View Model Getter
  ProfileEducationBloc get profileEducationBloc => _profileEducationBloc;

  @override
  void initState() {
    _profileEducationBloc = ProfileEducationBloc();
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
        return ColorName.neutral900;
      case 1:
        return ColorName.orangeBase;
      default:
        return ColorName.greenBase;
    }
  }

  /// Select chip background color
  int? selectText(int index) {
    switch (index) {
      case 0:
        return profileEducationBloc.state.waitingChipCounter;
      case 1:
        return profileEducationBloc.state.continuosChipCounter;
      default:
        return profileEducationBloc.state.completedChipCounter;
    }
  }
}
