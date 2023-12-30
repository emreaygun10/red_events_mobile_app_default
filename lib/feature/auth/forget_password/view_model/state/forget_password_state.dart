// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class ForgetPasswordState extends Equatable {
  const ForgetPasswordState({
    required this.isLoading,
    required this.isSend,
    required this.isCompletedOtp,
    this.password,
    this.second,
  });
  final bool isLoading;

  final String? password;

  final bool isSend;

  final int? second;

  final bool isCompletedOtp;

  @override
  List<Object?> get props => [
        isLoading,
        password,
        second,
        isCompletedOtp,
      ];

  ForgetPasswordState copyWith({
    bool? isLoading,
    bool? isSend,
    String? password,
    int? second,
    bool? isCompletedOtp,
  }) {
    return ForgetPasswordState(
      isLoading: isLoading ?? this.isLoading,
      password: password ?? this.password,
      isSend: isSend ?? this.isSend,
      second: second ?? 0,
      isCompletedOtp: isCompletedOtp ?? this.isCompletedOtp,
    );
  }
}
