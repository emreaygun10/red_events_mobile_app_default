// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class ProfileProgressPaymentState extends Equatable {
  const ProfileProgressPaymentState({
    required this.chipIndex,
    required this.isLoading,
    required this.isEmptyBordro,
  });
  final int? chipIndex;
  final bool isLoading;
  final bool isEmptyBordro;

  @override
  List<Object?> get props => [
        chipIndex,
        isLoading,
        isEmptyBordro,
      ];

  ProfileProgressPaymentState copyWith({
    int? chipIndex,
    bool? isLoading,
    bool? isEmptyBordro,
  }) {
    return ProfileProgressPaymentState(
      isEmptyBordro: isEmptyBordro ?? this.isEmptyBordro,
      chipIndex: chipIndex ?? this.chipIndex,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
