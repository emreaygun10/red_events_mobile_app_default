// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/password_enum.dart';

final class CreatePasswordState extends Equatable {
  const CreatePasswordState({
    required this.isLoading,
    required this.isObscure,
    required this.secondIsObscure,
    required this.passwordLevel,
    required this.isIncludeUpperLetter,
    required this.isIncludeNumber,
    required this.isLengthBiggerThanEight,
    required this.isPasswordsEqual,
    required this.firstTextFieldFocusNodeBool,
    required this.secondTextFieldFocusNodeBool,
    this.password,
  });
  final bool isLoading;

  final bool isObscure;

  final bool secondIsObscure;

  final String? password;

  final PasswordLevel passwordLevel;

  final bool isIncludeUpperLetter;

  final bool isIncludeNumber;

  final bool isLengthBiggerThanEight;

  final bool isPasswordsEqual;

  final bool firstTextFieldFocusNodeBool;

  final bool secondTextFieldFocusNodeBool;

  @override
  List<Object?> get props => [
        isLoading,
        isObscure,
        password,
        passwordLevel,
        isIncludeNumber,
        isIncludeUpperLetter,
        isLengthBiggerThanEight,
        secondIsObscure,
        isPasswordsEqual,
        firstTextFieldFocusNodeBool,
        secondTextFieldFocusNodeBool,
      ];

  CreatePasswordState copyWith({
    bool? isLoading,
    bool? isObscure,
    String? companyName,
    String? mail,
    String? password,
    PasswordLevel? passwordLevel,
    bool? isIncludeUpperLetter,
    bool? isIncludeNumber,
    bool? isLengthBiggerThanEight,
    bool? secondIsObscure,
    bool? isPasswordsEqual,
    bool? firstTextFieldFocusNodeBool,
    bool? secondTextFieldFocusNodeBool,
  }) {
    return CreatePasswordState(
      isLoading: isLoading ?? this.isLoading,
      isObscure: isObscure ?? this.isObscure,
      password: password ?? this.password,
      passwordLevel: passwordLevel ?? this.passwordLevel,
      isIncludeNumber: isIncludeNumber ?? this.isIncludeNumber,
      isIncludeUpperLetter: isIncludeUpperLetter ?? this.isIncludeUpperLetter,
      isLengthBiggerThanEight:
          isLengthBiggerThanEight ?? this.isLengthBiggerThanEight,
      secondIsObscure: secondIsObscure ?? this.secondIsObscure,
      isPasswordsEqual: isPasswordsEqual ?? this.isPasswordsEqual,
      firstTextFieldFocusNodeBool:
          firstTextFieldFocusNodeBool ?? this.firstTextFieldFocusNodeBool,
      secondTextFieldFocusNodeBool:
          secondTextFieldFocusNodeBool ?? this.secondTextFieldFocusNodeBool,
    );
  }
}
