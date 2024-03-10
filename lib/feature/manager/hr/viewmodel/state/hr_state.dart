// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/peronnel_model.dart';

class HrState extends Equatable {
  const HrState({
    required this.isEditMode,
    required this.personnelList,
    required this.buttonCounter,
    this.groupValue,
    this.selectedPersonnelList,
  });

  final bool isEditMode;
  final int? groupValue;
  final List<PersonnelModel> personnelList;
  final List<PersonnelModel>? selectedPersonnelList;
  final int buttonCounter;

  @override
  List<Object?> get props => [
        isEditMode,
        personnelList,
        selectedPersonnelList,
        groupValue,
        buttonCounter,
      ];

  HrState copyWith({
    bool? isEditMode,
    int? groupValue,
    List<PersonnelModel>? personnelList,
    List<PersonnelModel>? selectedPersonnelList,
    int? buttonCounter,
  }) {
    return HrState(
      isEditMode: isEditMode ?? this.isEditMode,
      groupValue: groupValue ?? this.groupValue,
      personnelList: personnelList ?? this.personnelList,
      selectedPersonnelList:
          selectedPersonnelList ?? this.selectedPersonnelList,
      buttonCounter: buttonCounter ?? this.buttonCounter,
    );
  }
}
