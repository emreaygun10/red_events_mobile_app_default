import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/auth/create_password/view_model/state/create_password_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/password_enum.dart';
import 'package:red_events_mobile_app_defult/product/utility/extension/regexs.dart';

/// SignIn state management class
class CreatePasswordViewModel extends BaseCubit<CreatePasswordState> {
  ///
  CreatePasswordViewModel()
      : super(
          const CreatePasswordState(
            isLoading: false,
            isObscure: true,
            passwordLevel: PasswordLevel.weak,
            isIncludeNumber: false,
            isIncludeUpperLetter: false,
            isLengthBiggerThanEight: false,
            secondIsObscure: false,
            isPasswordsEqual: false,
            firstTextFieldFocusNodeBool: false,
            secondTextFieldFocusNodeBool: false,
          ),
        );

  /// change value obscure
  void changeObscure() {
    emit(state.copyWith(isObscure: !state.isObscure));
  }

  /// change focus node value
  void changeFirstFocusNodeBool(bool value) {
    emit(state.copyWith(firstTextFieldFocusNodeBool: value));
  }

  /// change focus node value
  void changeSecondFocusNodeBool(bool value) {
    emit(state.copyWith(isObscure: value));
  }

  /// change value if passwords equals each other
  void changeIsPasswordEqual(bool value) {
    emit(state.copyWith(isPasswordsEqual: value));
  }

  /// change value second obscure
  void changeSecondObscure() {
    emit(state.copyWith(secondIsObscure: !state.secondIsObscure));
  }

  /// change value isIncludeLetter
  void changeIsIncludeNum(bool value) {
    emit(state.copyWith(isIncludeNumber: value));
  }

  bool get isIncNum => state.isIncludeNumber;

  /// change value isIncludeUpperLetter
  void changeIsIncludeUpperLetter(bool value) {
    emit(state.copyWith(isIncludeUpperLetter: value));
  }

  bool get isIncUpperLetter => state.isIncludeUpperLetter;

  /// change value isLengthBiggerThanEight
  void changeIsLengthBiggerThanEight(bool value) {
    emit(state.copyWith(isLengthBiggerThanEight: value));
  }

  bool get isLengthBiggerThanEight => state.isLengthBiggerThanEight;

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
    checkPasswordLevel();
  }

  void changePasswordLevel(PasswordLevel level) {
    emit(state.copyWith(passwordLevel: level));
  }

  /// Control password end change password level
  void checkPasswordLevel() {
    if (state.password.ext.isNotNullOrNoEmpty) {
      if (Regex.upperCase.hasMatch(state.password!)) {
        changeIsIncludeUpperLetter(true);
      } else {
        changeIsIncludeUpperLetter(false);
      }
      if (Regex.numberCase.hasMatch(state.password!)) {
        changeIsIncludeNum(true);
      } else {
        changeIsIncludeNum(false);
      }
      if (state.password!.length >= 8) {
        changeIsLengthBiggerThanEight(true);
      } else {
        changeIsLengthBiggerThanEight(false);
      }

      if (state.isIncludeNumber == true &&
          state.isIncludeUpperLetter == true &&
          state.isLengthBiggerThanEight == true) {
        changePasswordLevel(PasswordLevel.strong);
      } else if ((state.isIncludeNumber == true &&
              state.isIncludeUpperLetter == true) ||
          (state.isIncludeNumber == true &&
              state.isLengthBiggerThanEight == true) ||
          (state.isIncludeUpperLetter == true &&
              state.isLengthBiggerThanEight == true)) {
        changePasswordLevel(PasswordLevel.middle);
      } else {
        changePasswordLevel(PasswordLevel.weak);
      }
    } else {
      changePasswordLevel(PasswordLevel.weak);
    }
  }
}
