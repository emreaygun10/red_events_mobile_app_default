// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class ProfileEducationState extends Equatable {
  const ProfileEducationState({
    required this.chipIndex,
    required this.isLoading,
    this.completedChipCounter,
    this.continuosChipCounter,
    this.waitingChipCounter,
    this.educationList,
  });
  final int chipIndex;
  final int? waitingChipCounter;
  final int? continuosChipCounter;
  final int? completedChipCounter;
  final bool isLoading;
  final List<String>? educationList;

  @override
  List<Object?> get props => [
        chipIndex,
        waitingChipCounter,
        completedChipCounter,
        continuosChipCounter,
        isLoading,
        educationList,
      ];

  ProfileEducationState copyWith({
    int? chipIndex,
    int? waitingChipCounter,
    int? continuosChipCounter,
    int? completedChipCounter,
    bool? isLoading,
    List<String>? educationList,
  }) {
    return ProfileEducationState(
      chipIndex: chipIndex ?? this.chipIndex,
      waitingChipCounter: waitingChipCounter ?? this.waitingChipCounter,
      completedChipCounter: completedChipCounter ?? this.completedChipCounter,
      continuosChipCounter: continuosChipCounter ?? this.continuosChipCounter,
      isLoading: isLoading ?? this.isLoading,
      educationList: educationList ?? this.educationList,
    );
  }
}
