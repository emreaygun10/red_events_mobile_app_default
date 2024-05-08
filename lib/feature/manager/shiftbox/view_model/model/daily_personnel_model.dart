// ignore_for_file: public_member_api_docs, sort_constructors_first
class DailyPersonnelModel {
  DailyPersonnelModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.age,
    required this.phoneNumber,
    required this.job,
    required this.title,
    this.isAdded = false,
  });
  final int id;
  final String name;
  final String surname;
  final int age;
  final String phoneNumber;
  final String job;
  final String title;
  final bool isAdded;

  DailyPersonnelModel copyWith({
    int? id,
    String? name,
    String? surname,
    int? age,
    String? phoneNumber,
    String? job,
    String? title,
    bool? isAdded,
  }) {
    return DailyPersonnelModel(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      age: age ?? this.age,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      job: job ?? this.job,
      title: title ?? this.title,
      isAdded: isAdded ?? this.isAdded,
    );
  }
}
