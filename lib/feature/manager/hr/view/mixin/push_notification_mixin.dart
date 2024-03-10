import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/view/bottom_sheet_views/push_notification_view.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

mixin PushNotificationMixin on BaseState<PushNotificationView> {
  late final TextEditingController textTitleEditingController;
  late final TextEditingController textContentEditingController;
  late final SolidController solidController;

  @override
  void initState() {
    textTitleEditingController = TextEditingController();
    textContentEditingController = TextEditingController();
    solidController = SolidController();

    super.initState();
  }
}
