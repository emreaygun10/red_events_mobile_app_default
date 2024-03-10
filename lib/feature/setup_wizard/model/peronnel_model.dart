// ignore_for_file: public_member_api_docs, sort_constructors_first
class PersonnelModel {
  PersonnelModel({
    required this.nameSurname,
    required this.tcNo,
    required this.birthdate,
    required this.mail,
    required this.phoneNumber,
    required this.workType,
    required this.department,
    required this.part,
    required this.mission,
    required this.startDate,
    required this.salary,
    this.isCheck = false,
  });

  final String nameSurname;
  final String tcNo;
  final String birthdate;
  final String mail;
  final String phoneNumber;
  final String workType;
  final String department;
  final String part;
  final String mission;
  final String startDate;
  final String salary;
  final bool isCheck;

  PersonnelModel copyWith({
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
    bool? isCheck,
  }) {
    return PersonnelModel(
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
      isCheck: isCheck ?? this.isCheck,
    );
  }
}
