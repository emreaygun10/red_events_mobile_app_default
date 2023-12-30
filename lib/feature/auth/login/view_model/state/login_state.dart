// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class LoginState extends Equatable {
  const LoginState({
    required this.isLoading,
    required this.isObscure,
    required this.passwordFocus,
    this.companyName,
    this.mail,
    this.password,
  });
  final bool isLoading;

  final bool isObscure;

  final String? companyName;

  final String? mail;

  final String? password;

  final bool passwordFocus;

  @override
  List<Object?> get props => [
        isLoading,
        isObscure,
        companyName,
        mail,
        password,
        passwordFocus,
      ];

  LoginState copyWith({
    bool? isLoading,
    bool? isObscure,
    String? companyName,
    String? mail,
    String? password,
    bool? passwordFocus,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isObscure: isObscure ?? this.isObscure,
      companyName: companyName ?? this.companyName,
      mail: mail ?? this.mail,
      password: password ?? this.password,
      passwordFocus: passwordFocus ?? this.passwordFocus,
    );
  }
}
