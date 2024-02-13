// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class ProfileRequestChangeShiftState extends Equatable {
  const ProfileRequestChangeShiftState({
    required this.isLoading,
    required this.managerList,
    required this.isButtonEnable,
    required this.dayList,
    this.explanation,
    this.groupIndex,
    this.dayCheckBoxList = const [],
    this.managerCheckBoxList = const [],
  });

  final bool isLoading;
  final String? explanation;
  final int? groupIndex;
  final List<String> managerList;
  final List<String> managerCheckBoxList;
  final List<String> dayList;
  final List<String> dayCheckBoxList;
  final bool isButtonEnable;

  @override
  List<Object?> get props => [
        isLoading,
        explanation,
        groupIndex,
        managerCheckBoxList,
        managerList,
        isButtonEnable,
        dayList,
        dayCheckBoxList,
      ];

  ProfileRequestChangeShiftState copyWith({
    int? groupIndex,
    String? explanation,
    bool? isLoading,
    List<String>? managerList,
    List<String>? managerCheckBoxList,
    List<String>? dayList,
    List<String>? dayCheckBoxList,
    bool? isButtonEnable,
  }) {
    return ProfileRequestChangeShiftState(
      isButtonEnable: isButtonEnable ?? this.isButtonEnable,
      isLoading: isLoading ?? this.isLoading,
      groupIndex: groupIndex ?? this.groupIndex,
      explanation: explanation ?? this.explanation,
      managerList: managerList ?? this.managerList,
      managerCheckBoxList: managerCheckBoxList ?? this.managerCheckBoxList,
      dayList: dayList ?? this.dayList,
      dayCheckBoxList: dayCheckBoxList ?? this.dayCheckBoxList,
    );
  }
}
