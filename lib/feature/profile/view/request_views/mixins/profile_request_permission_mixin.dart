import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/cubit/profile_request_permission_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/profile_request_permission_view.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin ProfileRequestPermissionMixin on BaseState<ProfileRequestPermissionView> {
  late final ProfileRequestPermissionBloc profileRequestPermissionBloc;
  @override
  void initState() {
    profileRequestPermissionBloc = ProfileRequestPermissionBloc();
    super.initState();
  }

  final TextEditingController textEditingControllerExplanation =
      TextEditingController();

  final TextEditingController textEditingControllerSumDate =
      TextEditingController();

  final TextEditingController textEditingControllerStartDate =
      TextEditingController();

  final TextEditingController textEditingControllerEndDate =
      TextEditingController();
}
