import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/department_model.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/add_department_view.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/add_department_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin AddDepartmentMixin on BaseState<AddDepartmentView> {
  late final AddDepartmentBloc addDepartmentBloc;
  late final List<DepartmentModel> listDepartments;

  @override
  void initState() {
    listDepartments = [];
    addDepartmentBloc = AddDepartmentBloc();
    super.initState();
  }
}
