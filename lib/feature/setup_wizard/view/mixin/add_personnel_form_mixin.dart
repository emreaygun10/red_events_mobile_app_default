import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/add_personnel_form_view.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/add_personnel_form_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin AddPersonnelFormMixin on BaseState<AddPersonnelFormView> {
  late final TextEditingController nameSurnameController;
  late final TextEditingController tcController;
  late final TextEditingController birthdateController;
  late final TextEditingController mailController;
  late final TextEditingController phoneNumberController;
  late final AddPersonnelFormBloc addPersonnelFormBloc;

  /// Phone initial Country
  final String? initialCountry = 'TR';

  @override
  void initState() {
    addPersonnelFormBloc = AddPersonnelFormBloc();
    nameSurnameController = TextEditingController();
    tcController = TextEditingController();
    birthdateController = TextEditingController();
    mailController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.initState();
  }
}
