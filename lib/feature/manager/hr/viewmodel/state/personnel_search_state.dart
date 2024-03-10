// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/peronnel_model.dart';

class PersonnelSearchState extends Equatable {
  const PersonnelSearchState({
    required this.isTextNull,
    this.personnelList,
    this.text,
  });

  final List<PersonnelModel>? personnelList;
  final bool isTextNull;
  final String? text;

  @override
  List<Object?> get props => [
        personnelList,
        isTextNull,
        text,
      ];

  PersonnelSearchState copyWith({
    List<PersonnelModel>? personnelList,
    bool? isTextNull,
    String? text,
  }) {
    return PersonnelSearchState(
      personnelList: personnelList ?? this.personnelList,
      isTextNull: isTextNull ?? this.isTextNull,
      text: text ?? this.text,
    );
  }
}
