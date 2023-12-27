import 'package:red_events_mobile_app_defult/feature/auth/sign_in/view_model/state/sign_in_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// SignIn state management class
class SignInViewModel extends BaseCubit<SignInState> {
  ///
  SignInViewModel()
      : super(
          const SignInState(
            isLoading: false,
            isObscure: true,
          ),
        );

  /// change value obscure
  void changeObscure() {
    emit(state.copyWith(isObscure: !state.isObscure));
  }

  /// change value idLoading
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }
}
