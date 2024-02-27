// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class ProfileRequestSelectionManagerState extends Equatable {
  const ProfileRequestSelectionManagerState({
    required this.managerList,
    this.checkBoxList = const [],
  });

  final List<String> managerList;
  final List<String> checkBoxList;

  @override
  List<Object?> get props => [
        checkBoxList,
        managerList,
      ];

  ProfileRequestSelectionManagerState copyWith({
    List<String>? managerList,
    List<String>? checkBoxList,
  }) {
    return ProfileRequestSelectionManagerState(
      managerList: managerList ?? this.managerList,
      checkBoxList: checkBoxList ?? this.checkBoxList,
    );
  }
}
