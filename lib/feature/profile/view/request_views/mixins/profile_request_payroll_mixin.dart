import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/cubit/profile_request_payroll_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/profile_request_payroll_view.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin ProfileRequestPayrollMixin on BaseState<ProfileRequestPayrollView> {
  late final ProfileRequestPayrollBloc profileRequestPayrollBloc;
  String? textBoxString;

  @override
  void initState() {
    profileRequestPayrollBloc = ProfileRequestPayrollBloc(
      managerList: [
        'Aydanur Evrener',
        'Emre Aygün',
        'Ellen Rose',
        'Jerome Bell',
      ],
    );

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: add managers list
    super.didChangeDependencies();
  }

  final TextEditingController textEditingControllerExplanation =
      TextEditingController();

  final TextEditingController textEditingControllerPayrollType =
      TextEditingController();

  ///add manager
  void addManager(String manager) {
    final result = profileRequestPayrollBloc.addManagerList(manager);
    if (result) {
      if (textBoxString.ext.isNullOrEmpty) {
        textBoxString = manager;
      } else {
        if (!textBoxString!.contains(manager)) {
          textBoxString = '$textBoxString - $manager';
        }
      }
    }
  }

  ///remove manager
  void removeManager(String manager) {
    profileRequestPayrollBloc.removeManagerList(manager);
    if (textBoxString != null) {
      if (textBoxString!.contains('- $manager -')) {
        textBoxString = textBoxString!.replaceAll('- $manager -', '');
      } else if (textBoxString!.contains('- $manager')) {
        textBoxString = textBoxString!.replaceAll(' - $manager', '');
      } else if (textBoxString!.contains('$manager -')) {
        textBoxString = textBoxString!.replaceAll('$manager - ', '');
      } else if (textBoxString!.contains(manager)) {
        textBoxString = textBoxString!.replaceAll(manager, '');
      }
    }
  }
}
