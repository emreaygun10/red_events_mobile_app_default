// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class ProfileProgressPaymentState extends Equatable {
  const ProfileProgressPaymentState({
    required this.chipIndex,
    required this.isLoading,
    required this.isEmptyBordro,
    required this.selectedMonth,
  });
  final bool chipIndex;
  final bool isLoading;
  final bool isEmptyBordro;
  final DateTime selectedMonth;

  @override
  List<Object?> get props => [
        chipIndex,
        isLoading,
        isEmptyBordro,
        selectedMonth,
      ];

  ProfileProgressPaymentState copyWith({
    bool? chipIndex,
    bool? isLoading,
    bool? isEmptyBordro,
    DateTime? selectedMonth,
  }) {
    return ProfileProgressPaymentState(
      isEmptyBordro: isEmptyBordro ?? this.isEmptyBordro,
      chipIndex: chipIndex ?? this.chipIndex,
      isLoading: isLoading ?? this.isLoading,
      selectedMonth: selectedMonth ?? this.selectedMonth,
    );
  }
}
