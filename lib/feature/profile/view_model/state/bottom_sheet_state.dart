// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class BottomSheetState extends Equatable {
  const BottomSheetState({
    required this.groupIndex,
    required this.isLoading,
  });
  final int? groupIndex;
  final bool isLoading;

  @override
  List<Object?> get props => [
        groupIndex,
        isLoading,
      ];

  BottomSheetState copyWith({
    int? groupIndex,
    bool? isLoading,
  }) {
    return BottomSheetState(
      groupIndex: groupIndex ?? this.groupIndex,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
