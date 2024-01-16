// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class ProfilePerformanceState extends Equatable {
  const ProfilePerformanceState({
    required this.chipIndex,
    required this.isLoading,
    this.data,
  });
  final int chipIndex;
  final bool isLoading;
  final String? data;

  @override
  List<Object?> get props => [
        chipIndex,
        isLoading,
      ];

  ProfilePerformanceState copyWith({
    int? chipIndex,
    bool? isLoading,
    String? data,
  }) {
    return ProfilePerformanceState(
      chipIndex: chipIndex ?? this.chipIndex,
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
    );
  }
}
