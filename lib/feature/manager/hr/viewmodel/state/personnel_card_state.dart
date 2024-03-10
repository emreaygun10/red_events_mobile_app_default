import 'package:equatable/equatable.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/peronnel_model.dart';

class PersonnelCardState extends Equatable {
  const PersonnelCardState({this.personnelModel});

  final PersonnelModel? personnelModel;

  @override
  List<Object?> get props => [personnelModel];

  PersonnelCardState copyWith({
    PersonnelModel? personnelModel,
  }) {
    return PersonnelCardState(
      personnelModel: personnelModel ?? this.personnelModel,
    );
  }
}
