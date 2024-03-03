import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/department_model.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/state/add_department_form_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// Add Department form state management class
class AddDepartmentFormBloc extends BaseCubit<AddDepartmentFormState> {
  ///
  AddDepartmentFormBloc()
      : super(
          const AddDepartmentFormState(),
        );

  /// change company name
  void changeCompanyName(String companyName) {
    emit(state.copyWith(companyName: companyName));
  }

  /// change manager name
  void changeManagerName(String managerName) {
    emit(state.copyWith(departmentManagerName: managerName));
  }

  /// change manager mail
  void changeManagerMail(String mail) {
    emit(state.copyWith(departmentManagerMail: mail));
  }

  /// change manager phone
  void changeManagerPhone(String phone) {
    emit(state.copyWith(departmentManagerNumber: phone));
  }

  /// change model
  void changeModel(DepartmentModel model) {
    emit(state.copyWith(departmentModel: model));
  }
}
