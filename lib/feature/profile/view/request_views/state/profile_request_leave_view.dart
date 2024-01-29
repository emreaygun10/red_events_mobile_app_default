// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class ProfileRequestLeaveState extends Equatable {
  const ProfileRequestLeaveState({
    required this.isLoading,
    required this.groupIndex,
    this.leaveReason,
  });

  final bool isLoading;
  final String? leaveReason;
  final int groupIndex;

  @override
  List<Object?> get props => [
        isLoading,
        leaveReason,
        groupIndex,
      ];

  ProfileRequestLeaveState copyWith({
    String? leaveReason,
    bool? isLoading,
    int? groupIndex,
  }) {
    return ProfileRequestLeaveState(
      isLoading: isLoading ?? this.isLoading,
      leaveReason: leaveReason ?? this.leaveReason,
      groupIndex: groupIndex ?? this.groupIndex,
    );
  }
}
