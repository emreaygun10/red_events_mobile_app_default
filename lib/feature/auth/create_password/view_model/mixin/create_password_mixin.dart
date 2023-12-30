import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/auth/create_password/view/create_password_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/create_password/view_model/create_password_view_model.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin CreatePasswordMixin on BaseState<CreatePasswordView> {
  late final CreatePasswordViewModel _createPasswordViewModel;
  late final FocusNode passwordFocusNode;
  late final FocusNode secondPasswordFocusNode;

  /// View Model Getter
  CreatePasswordViewModel get createPasswordViewModel =>
      _createPasswordViewModel;

  /// Form Global Key
  final GlobalKey<FormState> formKey = GlobalKey();

  /// Text editing controller first passwords controller
  final TextEditingController passwordController = TextEditingController();

  /// Text editing controller second passwords  controller
  TextEditingController passwordControllerTwo = TextEditingController();

  @override
  void initState() {
    _createPasswordViewModel = CreatePasswordViewModel();
    passwordFocusNode = FocusNode()
      ..addListener(() {
        createPasswordViewModel
            .changeFirstFocusNodeBool(passwordFocusNode.hasFocus);
      });
    secondPasswordFocusNode = FocusNode()
      ..addListener(() {
        createPasswordViewModel
            .changeSecondFocusNodeBool(secondPasswordFocusNode.hasFocus);
      });

    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    secondPasswordFocusNode.dispose();
    super.dispose();
  }

  /// Hide Keyboard
  void hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void changePassword(String password) {
    createPasswordViewModel.setPassword(password);
    checkPasswordEqual(password);
  }

  /// Todo Furure<bool>
  void postSignIn() {
    if (formKey.currentState?.validate() ?? false) {
      /// TODO: send to service
    } else {}
  }

  void checkPasswordEqual(String value) {
    if (createPasswordViewModel.state.password.toString().trim() ==
        passwordControllerTwo.text.trim()) {
      createPasswordViewModel.changeIsPasswordEqual(true);
    } else {
      createPasswordViewModel.changeIsPasswordEqual(false);
    }
  }
}
