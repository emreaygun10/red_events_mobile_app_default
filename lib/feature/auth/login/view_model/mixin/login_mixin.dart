import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:red_events_mobile_app_defult/feature/auth/login/view/login_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/login/view_model/login_view_model.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
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

  late final LocalAuthentication auth;

  late bool _supportState;

  @override
  void initState() {
    _supportState = false;
    _loginViewModel = LoginViewModel();
    passwordFocusNode = FocusNode()
      ..addListener(() {
        loginViewModel
            .changePasswordFocusNodeHasFocus(passwordFocusNode.hasFocus);
      });
    auth = LocalAuthentication();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() {
            _supportState = isSupported;
          }),
        );

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

  Future<void> getAvailableBiometrics() async {
    final avaibleBiometrics = await auth.getAvailableBiometrics();

    print('List of avaibleBiometrics: $avaibleBiometrics');

    if (!mounted) {
      return;
    }
  }

  Future<void> authenticate() async {
    try {
      final authenticated = await auth.authenticate(
        localizedReason: 'Use Face Id for authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
        authMessages: <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: LocaleKeys.login_authentication_access.tr(),
            cancelButton: LocaleKeys.login_authentication_cancel.tr(),
          ),
          IOSAuthMessages(
            cancelButton: LocaleKeys.login_authentication_cancel.tr(),
          ),
        ],
      );
      if (authenticated) {
        await context.router.push(const AddPersonnelRoute());
      }
      print('Authenticated : $authenticated');
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}
