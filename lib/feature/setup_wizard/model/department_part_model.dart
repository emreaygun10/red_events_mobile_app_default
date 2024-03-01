class DepartmentPart {
  DepartmentPart({
    required this.departmentPartName,
    required this.departmentPartManager,
    required this.departmentPartMail,
    required this.departmentPartPhone,
    required this.departmentPartChapters,
  });

  final String departmentPartName;
  final String departmentPartManager;
  final String departmentPartMail;
  final String departmentPartPhone;
  final List<String> departmentPartChapters;

  DepartmentPart copyWith({
    String? departmentPartName,
    String? departmentPartManager,
    String? departmentPartMail,
    String? departmentPartPhone,
    List<String>? departmentPartChapters,
  }) {
    return DepartmentPart(
      departmentPartName: departmentPartName ?? this.departmentPartName,
      departmentPartManager:
          departmentPartManager ?? this.departmentPartManager,
      departmentPartMail: departmentPartMail ?? this.departmentPartMail,
      departmentPartPhone: departmentPartPhone ?? this.departmentPartPhone,
      departmentPartChapters:
          departmentPartChapters ?? this.departmentPartChapters,
    );
  }
}
