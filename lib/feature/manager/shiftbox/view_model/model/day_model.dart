// ignore_for_file: public_member_api_docs, sort_constructors_first
class DayModel {
  DayModel({required this.day, this.value = false});

  final String day;
  final bool value;

  DayModel copyWith({
    String? day,
    bool? value,
  }) {
    return DayModel(
      day: day ?? this.day,
      value: value ?? this.value,
    );
  }
}
