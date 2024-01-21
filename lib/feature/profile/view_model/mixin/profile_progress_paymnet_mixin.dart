import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_progress_payment_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/cubit/profile_progress_payment_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin ProfileProgressPaymentMixin on BaseState<ProfileProgressPaymentView> {
  late final ProfileProgressPaymentBloc _profileProgressPaymentBloc;

  /// View Model Getter
  ProfileProgressPaymentBloc get profileProgressPaymentBloc =>
      _profileProgressPaymentBloc;

  @override
  void initState() {
    _profileProgressPaymentBloc = ProfileProgressPaymentBloc();
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
