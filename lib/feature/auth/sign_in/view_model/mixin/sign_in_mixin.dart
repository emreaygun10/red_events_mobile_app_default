import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/auth/sign_in/view/sign_in_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/sign_in/view_model/sign_in_view_model.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin SignInMixin on BaseState<SignInView> {
  late final SignInViewModel _signInViewModel;

  /// Focus Node from companyName
  late FocusNode focusNodeCompanyName;

  /// Focus Node from company mail
  late FocusNode focusNodeCompanyMail;

  /// Focus Node from password
  late FocusNode focusNodePassword;

  /// View Model Getter
  SignInViewModel get signInViewModel => _signInViewModel;

  @override
  void initState() {
    _signInViewModel = SignInViewModel();
    focusNodeCompanyName = FocusNode();
    focusNodeCompanyMail = FocusNode();
    focusNodePassword = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    focusNodePassword.dispose();
    focusNodeCompanyMail.dispose();
    focusNodeCompanyName.dispose();
    super.dispose();
  }

  /// Hide Keyboard
  void hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
