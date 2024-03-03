import 'package:equatable/equatable.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/department_model.dart';

class AddDepartmentFormState extends Equatable {
  const AddDepartmentFormState({
    this.departmentModel,
    this.companyName,
    this.departmentManagerName,
    this.departmentManagerMail,
    this.departmentManagerNumber,
  });

  final DepartmentModel? departmentModel;
  final String? companyName;
  final String? departmentManagerName;
  final String? departmentManagerMail;
  final String? departmentManagerNumber;
  @override
  List<Object?> get props => [
        departmentModel,
        companyName,
        departmentManagerMail,
        departmentManagerName,
        departmentManagerNumber,
      ];

  AddDepartmentFormState copyWith({
    DepartmentModel? departmentModel,
    String? departmentManagerMail,
    String? departmentManagerName,
    String? companyName,
    String? departmentManagerNumber,
  }) {
    return AddDepartmentFormState(
      departmentModel: departmentModel ?? this.departmentModel,
      companyName: companyName ?? this.companyName,
      departmentManagerMail:
          departmentManagerMail ?? this.departmentManagerMail,
      departmentManagerName:
          departmentManagerName ?? this.departmentManagerName,
      departmentManagerNumber:
          departmentManagerNumber ?? this.departmentManagerNumber,
    );
  }
}
