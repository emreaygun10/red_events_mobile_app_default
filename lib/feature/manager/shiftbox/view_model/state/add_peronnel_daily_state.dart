import 'package:equatable/equatable.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/model/daily_personnel_model.dart';

class AddPersonnelDailyState extends Equatable {
  const AddPersonnelDailyState({
    this.personnelList,
    this.addedPersonnelList,
    this.selectedPerson,
    this.selectedChip = 0,
  });

  final List<DailyPersonnelModel>? personnelList;
  final List<DailyPersonnelModel>? addedPersonnelList;
  final DailyPersonnelModel? selectedPerson;
  final int selectedChip;
  @override
  List<Object?> get props => [
        personnelList,
        addedPersonnelList,
        selectedPerson,
        selectedChip,
      ];

  AddPersonnelDailyState copyWith({
    List<DailyPersonnelModel>? personnelList,
    List<DailyPersonnelModel>? addedPersonnelList,
    DailyPersonnelModel? selectedPerson,
    int? selectedChip,
  }) {
    return AddPersonnelDailyState(
      personnelList: personnelList ?? this.personnelList,
      addedPersonnelList: addedPersonnelList ?? this.addedPersonnelList,
      selectedPerson: selectedPerson ?? this.selectedPerson,
      selectedChip: selectedChip ?? this.selectedChip,
    );
  }
}
