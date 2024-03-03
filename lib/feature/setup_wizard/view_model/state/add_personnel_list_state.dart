// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/peronnel_model.dart';

class AddPersonnelListState extends Equatable {
  const AddPersonnelListState({
    required this.personnelList,
    required this.isDisable,
  });

  final List<PersonnelModel> personnelList;
  final bool isDisable;
  @override
  List<Object?> get props => [personnelList, isDisable];

  AddPersonnelListState copyWith({
    List<PersonnelModel>? personnelList,
    bool? isDisable,
  }) {
    return AddPersonnelListState(
      personnelList: personnelList ?? this.personnelList,
      isDisable: isDisable ?? this.isDisable,
    );
  }
}
