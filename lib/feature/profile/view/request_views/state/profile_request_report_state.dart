// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class ProfileRequestReportState extends Equatable {
  const ProfileRequestReportState({
    required this.isLoading,
    required this.isLoaded,
    this.groupIndex,
  });

  final bool isLoading;
  final int? groupIndex;
  final bool isLoaded;

  ///TODO: add model list
  @override
  List<Object?> get props => [
        isLoading,
        groupIndex,
        isLoaded,
      ];

  ProfileRequestReportState copyWith({
    int? groupIndex,
    bool? isLoading,
    bool? isLoaded,
  }) {
    return ProfileRequestReportState(
      isLoading: isLoading ?? this.isLoading,
      groupIndex: groupIndex ?? this.groupIndex,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}
