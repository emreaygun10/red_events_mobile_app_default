// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class ProfileRequestPermissionState extends Equatable {
  const ProfileRequestPermissionState({
    required this.sumDate,
    required this.isLoading,
    required this.buttonIsEnabled,
    this.permissionType,
    this.endDate,
    this.startDate,
  });
  final int? sumDate;
  final bool isLoading;
  final int? permissionType;
  final bool buttonIsEnabled;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  List<Object?> get props => [
        sumDate,
        isLoading,
        permissionType,
        buttonIsEnabled,
        startDate,
        endDate,
      ];

  ProfileRequestPermissionState copyWith({
    int? sumDate,
    bool? isLoading,
    bool? buttonIsEnabled,
    int? permissionType,
    DateTime? endDate,
    DateTime? startDate,
  }) {
    return ProfileRequestPermissionState(
      sumDate: sumDate ?? this.sumDate,
      isLoading: isLoading ?? this.isLoading,
      buttonIsEnabled: buttonIsEnabled ?? this.buttonIsEnabled,
      permissionType: permissionType ?? this.permissionType,
      endDate: endDate ?? this.endDate,
      startDate: startDate ?? this.startDate,
    );
  }
}
