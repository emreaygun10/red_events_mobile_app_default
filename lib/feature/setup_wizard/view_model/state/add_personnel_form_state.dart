// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AddPersonnelFormState extends Equatable {
  const AddPersonnelFormState({
    this.nameSurname,
    this.tcNo,
    this.birthdate,
    this.mail,
    this.phoneNumber,
    this.workType,
    this.department,
    this.part,
    this.mission,
    this.startDate,
    this.salary,
  });

  final String? nameSurname;
  final String? tcNo;
  final String? birthdate;
  final String? mail;
  final String? phoneNumber;
  final String? workType;
  final String? department;
  final String? part;
  final String? mission;
  final String? startDate;
  final String? salary;

  @override
  List<Object?> get props => [
        nameSurname,
        tcNo,
        birthdate,
        mail,
        phoneNumber,
        workType,
        department,
        part,
        mission,
        startDate,
        salary,
      ];

  AddPersonnelFormState copyWith({
    String? nameSurname,
    String? tcNo,
    String? birthdate,
    String? mail,
    String? phoneNumber,
    String? workType,
    String? department,
    String? part,
    String? mission,
    String? startDate,
    String? salary,
  }) {
    return AddPersonnelFormState(
      nameSurname: nameSurname ?? this.nameSurname,
      tcNo: tcNo ?? this.tcNo,
      birthdate: birthdate ?? this.birthdate,
      mail: mail ?? this.mail,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      workType: workType ?? this.workType,
      department: department ?? this.department,
      part: part ?? this.part,
      mission: mission ?? this.mission,
      startDate: startDate ?? this.startDate,
      salary: salary ?? this.salary,
    );
  }
}
