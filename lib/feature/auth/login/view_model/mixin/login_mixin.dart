import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/auth/login/view/login_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/login/view_model/login_view_model.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin LoginMixin on BaseState<LoginView> {
  late final LoginViewModel _loginViewModel;
  late final FocusNode passwordFocusNode;

  /// View Model Getter
  LoginViewModel get loginViewModel => _loginViewModel;

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
    _loginViewModel = LoginViewModel();
    passwordFocusNode = FocusNode()
      ..addListener(() {
        loginViewModel
            .changePasswordFocusNodeHasFocus(passwordFocusNode.hasFocus);
      });
    super.initState();
  }

  @override
  void dispose() {
    passwordFocusNode.dispose();
    super.dispose();
  }

  /// Hide Keyboard
  void hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  set changeName(String name) {
    loginViewModel.setCompanyName(name);
  }

  set changeMail(String mail) {
    loginViewModel.setCompanyMail(mail);
  }

  void changePassword(String password) {
    loginViewModel.setPassword(password);
  }

  /// Todo Furure<bool>
  void postLogin() {
    if (formKey.currentState?.validate() ?? false) {
      /// TODO: send to service
    } else {}
  }
}
