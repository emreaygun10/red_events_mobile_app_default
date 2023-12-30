import 'package:red_events_mobile_app_defult/feature/auth/login/view_model/state/login_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// SignIn state management class
class LoginViewModel extends BaseCubit<LoginState> {
  ///
  LoginViewModel()
      : super(
          const LoginState(
            isLoading: false,
            isObscure: true,
            passwordFocus: false,
          ),
        );

  /// Changer focus node hasFocus value in state
  void changePasswordFocusNodeHasFocus(bool value) {
    emit(state.copyWith(passwordFocus: value));
  }

  /// change value obscure
  void changeObscure() {
    emit(state.copyWith(isObscure: !state.isObscure));
  }

  /// change value idLoading
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// company name setter
  void setCompanyName(String name) {
    emit(state.copyWith(companyName: name));
  }

  /// company mail setter
  void setCompanyMail(String mail) {
    emit(state.copyWith(mail: mail));
  }

  /// password setter
  void setPassword(String password) {
    emit(state.copyWith(password: password));
  }
}
