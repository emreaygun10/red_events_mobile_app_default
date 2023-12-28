import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/auth/login/view/login_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/login/view_model/login_view_model.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin LoginMixin on BaseState<LoginView> {
  late final LoginViewModel _loginViewModel;

  /// Focus Node from companyName
  late FocusNode focusNodeCompanyName;

  /// Focus Node from company mail
  late FocusNode focusNodeCompanyMail;

  /// Focus Node from password
  late FocusNode focusNodePassword;

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
