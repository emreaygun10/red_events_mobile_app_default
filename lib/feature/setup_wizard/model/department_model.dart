// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/department_part_model.dart';

class DepartmentModel {
  DepartmentModel({
    required this.departmentName,
    required this.departmentManager,
    required this.managerMail,
    required this.managerPhone,
    this.departmentParts,
  });

  final String departmentName;
  final String departmentManager;
  final String managerMail;
  final String managerPhone;
  final List<DepartmentPart>? departmentParts;

  DepartmentModel copyWith({
    String? departmentName,
    String? departmentManager,
    String? managerMail,
    String? managerPhone,
    List<DepartmentPart>? departmentParts,
  }) {
    return DepartmentModel(
      departmentName: departmentName ?? this.departmentName,
      departmentManager: departmentManager ?? this.departmentManager,
      managerMail: managerMail ?? this.managerMail,
      managerPhone: managerPhone ?? this.managerPhone,
      departmentParts: departmentParts ?? this.departmentParts,
    );
  }
}
