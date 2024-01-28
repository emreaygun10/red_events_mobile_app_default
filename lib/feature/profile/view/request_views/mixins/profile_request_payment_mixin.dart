import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/cubit/profile_request_advance_payment.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/profile_request_advance_payment_view.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin ProfileRequestAdvancePaymentMixin
    on BaseState<ProfileRequestAdvancePaymentView> {
  late final ProfileRequestAdvancePaymentBloc profileRequestAdvancePaymentBloc;
  @override
  void initState() {
    profileRequestAdvancePaymentBloc = ProfileRequestAdvancePaymentBloc();
    super.initState();
  }

  final TextEditingController textEditingControllerExplanation =
      TextEditingController();

  final TextEditingController textEditingControllerAdvanceAmount =
      TextEditingController();
}
