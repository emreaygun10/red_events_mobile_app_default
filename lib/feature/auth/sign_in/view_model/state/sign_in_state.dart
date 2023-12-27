// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class SignInState extends Equatable {
  const SignInState({
    required this.isLoading,
    required this.isObscure,
  });
  final bool isLoading;

  final bool isObscure;

  @override
  List<Object?> get props => [isLoading, isObscure];

  SignInState copyWith({
    bool? isLoading,
    bool? isObscure,
  }) {
    return SignInState(
      isLoading: isLoading ?? this.isLoading,
      isObscure: isObscure ?? this.isObscure,
    );
  }
}
