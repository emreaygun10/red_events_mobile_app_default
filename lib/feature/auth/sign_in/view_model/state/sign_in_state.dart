// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/password_enum.dart';

final class SignInState extends Equatable {
  const SignInState({
    required this.isLoading,
    required this.isObscure,
    required this.passwordLevel,
    required this.isIncludeUpperLetter,
    required this.isIncludeNumber,
    required this.isLengthBiggerThanEight,
    this.companyName,
    this.mail,
    this.password,
  });
  final bool isLoading;

  final bool isObscure;

  final String? companyName;

  final String? mail;

  final String? password;

  final PasswordLevel passwordLevel;

  final bool isIncludeUpperLetter;

  final bool isIncludeNumber;

  final bool isLengthBiggerThanEight;

  @override
  List<Object?> get props => [
        isLoading,
        isObscure,
        companyName,
        mail,
        password,
        passwordLevel,
        isIncludeNumber,
        isIncludeUpperLetter,
        isLengthBiggerThanEight,
      ];

  SignInState copyWith({
    bool? isLoading,
    bool? isObscure,
    String? companyName,
    String? mail,
    String? password,
    PasswordLevel? passwordLevel,
    bool? isIncludeUpperLetter,
    bool? isIncludeNumber,
    bool? isLengthBiggerThanEight,
  }) {
    return SignInState(
      isLoading: isLoading ?? this.isLoading,
      isObscure: isObscure ?? this.isObscure,
      companyName: companyName ?? this.companyName,
      mail: mail ?? this.mail,
      password: password ?? this.password,
      passwordLevel: passwordLevel ?? this.passwordLevel,
      isIncludeNumber: isIncludeNumber ?? this.isIncludeNumber,
      isIncludeUpperLetter: isIncludeUpperLetter ?? this.isIncludeUpperLetter,
      isLengthBiggerThanEight:
          isLengthBiggerThanEight ?? this.isLengthBiggerThanEight,
    );
  }
}
