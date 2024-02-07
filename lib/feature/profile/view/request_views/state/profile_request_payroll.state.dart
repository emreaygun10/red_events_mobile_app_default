// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class ProfileRequestPayrollState extends Equatable {
  const ProfileRequestPayrollState({
    required this.isLoading,
    required this.managerList,
    required this.isButtonEnable,
    this.explanation,
    this.groupIndex,
    this.checkBoxList = const [],
  });

  final bool isLoading;
  final String? explanation;
  final int? groupIndex;
  final List<String> managerList;
  final List<String> checkBoxList;
  final bool isButtonEnable;

  @override
  List<Object?> get props => [
        isLoading,
        explanation,
        groupIndex,
        checkBoxList,
        managerList,
        isButtonEnable,
      ];

  ProfileRequestPayrollState copyWith({
    int? groupIndex,
    String? explanation,
    bool? isLoading,
    List<String>? managerList,
    List<String>? checkBoxList,
    bool? isButtonEnable,
  }) {
    return ProfileRequestPayrollState(
      isButtonEnable: isButtonEnable ?? this.isButtonEnable,
      isLoading: isLoading ?? this.isLoading,
      groupIndex: groupIndex ?? this.groupIndex,
      explanation: explanation ?? this.explanation,
      managerList: managerList ?? this.managerList,
      checkBoxList: checkBoxList ?? this.checkBoxList,
    );
  }
}
