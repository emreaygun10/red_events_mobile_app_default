import 'package:red_events_mobile_app_defult/feature/auth/forget_password/view_model/state/forget_password_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// SignIn state management class
class ForgetPasswordModelView extends BaseCubit<ForgetPasswordState> {
  ///
  ForgetPasswordModelView()
      : super(
          const ForgetPasswordState(
            isLoading: false,
            isSend: false,
            isCompletedOtp: false,
          ),
        );

  /// change value idLoading
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// change value isCompletedOtp
  void changeIsCompletedOtp(bool value) {
    emit(state.copyWith(isCompletedOtp: value));
  }

  // /// set value zero for second
  // void setZeroSecond() {
  //   emit(state.copyWith(second: 0));
  // }

  /// change value isSending
  /// If code send to mail, isSend is True
  void changeIsSend() {
    emit(state.copyWith(isSend: !state.isSend));
  }

  /// password setter
  void setPassword(String password) {
    emit(state.copyWith(password: password));
  }

  void setSecond(int value) {
    emit(state.copyWith(second: value));
  }
}
