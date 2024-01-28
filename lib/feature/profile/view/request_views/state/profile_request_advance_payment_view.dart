// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class ProfileRequestAdvancePaymentState extends Equatable {
  const ProfileRequestAdvancePaymentState({
    required this.isLoading,
    required this.isEnable,
    this.paymentAmount,
  });

  final bool isLoading;
  final String? paymentAmount;
  final bool isEnable;

  @override
  List<Object?> get props => [
        isLoading,
        paymentAmount,
        isEnable,
      ];

  ProfileRequestAdvancePaymentState copyWith({
    String? paymentAmount,
    bool? isLoading,
    bool? isEnable,
  }) {
    return ProfileRequestAdvancePaymentState(
      isLoading: isLoading ?? this.isLoading,
      paymentAmount: paymentAmount ?? this.paymentAmount,
      isEnable: isEnable ?? this.isEnable,
    );
  }
}
