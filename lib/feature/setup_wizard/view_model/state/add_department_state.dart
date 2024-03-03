import 'package:equatable/equatable.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/department_model.dart';

class AddDepartmentState extends Equatable {
  const AddDepartmentState({
    required this.isEmpty,
    this.departmentModel,
    this.departmentList,
  });

  final bool isEmpty;
  final DepartmentModel? departmentModel;
  final List<DepartmentModel>? departmentList;
  @override
  List<Object?> get props => [isEmpty, departmentModel, departmentList];

  AddDepartmentState copyWith({
    DepartmentModel? departmentModel,
    bool? isEmpty,
    List<DepartmentModel>? departmentList,
  }) {
    return AddDepartmentState(
      departmentModel: departmentModel ?? this.departmentModel,
      isEmpty: isEmpty ?? this.isEmpty,
      departmentList: departmentList ?? this.departmentList,
    );
  }
}
