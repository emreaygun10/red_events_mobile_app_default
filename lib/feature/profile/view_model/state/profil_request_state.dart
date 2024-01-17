// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class ProfileRequestState extends Equatable {
  const ProfileRequestState({
    required this.chipIndex,
    required this.isLoading,
    this.acceptedChipCounter,
    this.rejectedChipCounter,
    this.waitingChipCounter,
    this.requestList,
  });
  final int chipIndex;
  final bool isLoading;
  final int? waitingChipCounter;
  final int? rejectedChipCounter;
  final int? acceptedChipCounter;
  final List<String>? requestList;

  @override
  List<Object?> get props => [
        chipIndex,
        isLoading,
        requestList,
        waitingChipCounter,
        rejectedChipCounter,
        acceptedChipCounter,
      ];

  ProfileRequestState copyWith({
    int? chipIndex,
    bool? isLoading,
    List<String>? requestList,
    int? waitingChipCounter,
    int? acceptedChipCounter,
    int? rejectedChipCounter,
  }) {
    return ProfileRequestState(
      chipIndex: chipIndex ?? this.chipIndex,
      isLoading: isLoading ?? this.isLoading,
      requestList: requestList ?? this.requestList,
      waitingChipCounter: waitingChipCounter ?? this.waitingChipCounter,
      acceptedChipCounter: acceptedChipCounter ?? this.acceptedChipCounter,
      rejectedChipCounter: rejectedChipCounter ?? this.rejectedChipCounter,
    );
  }
}
