import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/cubit/profile_request_leave_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/profile_request_leave_view.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin ProfileRequestLeaveMixin on BaseState<ProfileRequestLeaveView> {
  late final ProfileRequestLeaveBloc _profileRequestLeaveBloc;

  ProfileRequestLeaveBloc get profileRequestLeaveBloc =>
      _profileRequestLeaveBloc;
  @override
  void initState() {
    _profileRequestLeaveBloc = ProfileRequestLeaveBloc();
    super.initState();
  }

  final TextEditingController textEditingControllerExplanation =
      TextEditingController();

  final TextEditingController textEditingControllerLeaveDesc =
      TextEditingController();
}
