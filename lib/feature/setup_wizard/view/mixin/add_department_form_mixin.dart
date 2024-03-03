import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/department_model.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/add_department_form_view.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/add_department_form_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin AddDepartmentFormMixin on BaseState<AddDepartmentFormView> {
  late final AddDepartmentFormBloc addDepartmentFormBloc;
  late final DepartmentModel departmentModel;
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController departmentManagerNameController =
      TextEditingController();
  final TextEditingController departmentManagerMailController =
      TextEditingController();
  final TextEditingController phoneEditingController = TextEditingController();

  /// Phone initial Country
  final String? initialCountry = 'TR';

  /// Phone initial Country
  final String? initialDialCode = '+90';

  @override
  void initState() {
    addDepartmentFormBloc = AddDepartmentFormBloc();
    departmentModel = DepartmentModel(
      companyName: '',
      departmentManager: '',
      managerMail: '',
      managerPhone: '',
    );
    super.initState();
  }
}
