import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/auth/sign_in/view/sign_in_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/sign_in/view_model/sign_in_view_model.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin SignInMixin on BaseState<SignInView> {
  late final SignInViewModel _signInViewModel;
  late final FocusNode passwordFocusNode;

  /// View Model Getter
  SignInViewModel get signInViewModel => _signInViewModel;

  /// Form Global Key
  final GlobalKey<FormState> formKey = GlobalKey();

  /// Text editing controller company name controller
  final TextEditingController companyNameController = TextEditingController();

  /// Text editing controller company mail controller
  final TextEditingController companyMailController = TextEditingController();

  /// Text editing controller passwords controller
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    _signInViewModel = SignInViewModel();
    passwordFocusNode = FocusNode()
      ..addListener(() {
        signInViewModel.changeFocusPassword(passwordFocusNode.hasFocus);
      });

    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  /// Hide Keyboard
  void hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  set changeName(String name) {
    signInViewModel.setCompanyName(name);
  }

  set changeMail(String mail) {
    signInViewModel.setCompanyMail(mail);
  }

  void changePassword(String password) {
    signInViewModel.setPassword(password);
  }

  /// Todo Furure<bool>
  void postSignIn() {
    if (formKey.currentState?.validate() ?? false) {
      /// TODO: send to service
    } else {}
  }
}
