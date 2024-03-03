import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/department_model.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/state/add_department_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// Profile Education state management class
class AddDepartmentBloc extends BaseCubit<AddDepartmentState> {
  ///
  AddDepartmentBloc()
      : super(
          const AddDepartmentState(
            isEmpty: true,
          ),
        );

  ///
  void changeIsEmpty(bool isEmpty) {
    emit(state.copyWith(isEmpty: isEmpty));
  }

  /// change model
  void changeModel(DepartmentModel model) {
    emit(state.copyWith(departmentModel: model));
  }

  void changeModelList(List<DepartmentModel> list) {
    emit(state.copyWith(departmentList: list));
  }
}
