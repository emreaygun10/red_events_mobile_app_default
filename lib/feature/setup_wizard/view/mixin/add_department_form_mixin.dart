import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/add_department_form_view.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin AddDepartmentFormMixin on BaseState<AddDepartmentFormView> {
  /// Phone initial Country
  final String? initialCountry = 'TR';

  /// Phone initial Country
  final String? initialDialCode = '+90';

  TextEditingController phoneEditingController = TextEditingController();
}
