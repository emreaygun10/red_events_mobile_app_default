// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class ForgetPasswordState extends Equatable {
  const ForgetPasswordState({
    required this.isLoading,
    required this.isSend,
    required this.isCompletedOtp,
    required this.isClearOtp,
    this.password,
    this.second,
  });
  final bool isLoading;

  final String? password;

  final bool isSend;

  final int? second;

  final bool isCompletedOtp;

  final bool isClearOtp;

  @override
  List<Object?> get props => [
        isLoading,
        password,
        second,
        isCompletedOtp,
        isClearOtp,
      ];

  ForgetPasswordState copyWith({
    bool? isLoading,
    bool? isSend,
    String? password,
    int? second,
    bool? isCompletedOtp,
    bool? isClearOtp,
  }) {
    return ForgetPasswordState(
      isLoading: isLoading ?? this.isLoading,
      password: password ?? this.password,
      isSend: isSend ?? this.isSend,
      second: second ?? 0,
      isCompletedOtp: isCompletedOtp ?? this.isCompletedOtp,
      isClearOtp: isClearOtp ?? this.isClearOtp,
    );
  }
}
