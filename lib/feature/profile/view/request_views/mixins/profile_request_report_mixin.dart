import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/cubit/profile_request_report_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/profile_request_report_view.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin ProfileRequestReportMixin on BaseState<ProfileRequestReportView> {
  late final ProfileRequestReportBloc profileRequestReportBloc;
  @override
  void initState() {
    profileRequestReportBloc = ProfileRequestReportBloc();
    super.initState();
  }

  final TextEditingController textEditingControllerExplanation =
      TextEditingController();

  final TextEditingController textEditingControllerReportType =
      TextEditingController();
}
