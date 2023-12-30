import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/auth/forget_password/view/forget_password_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/forget_password/view_model/forget_password_view_model.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

mixin ForgetPasswordMixin on BaseState<ForgetPasswordView> {
  late ForgetPasswordModelView _forgetPasswordModelView;
  late StopWatchTimer stopWatchTimer;

  ForgetPasswordModelView get forgetPasswordModelView =>
      _forgetPasswordModelView;

  /// Form Global Key
  final GlobalKey<FormState> formKey = GlobalKey();

  /// Text editing controller mail controller
  final TextEditingController mailController = TextEditingController();

  @override
  void initState() {
    _forgetPasswordModelView = ForgetPasswordModelView();
    stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond:
          StopWatchTimer.getMilliSecFromSecond(60), // millisecond => minute.
    );
    // Start timer.
    stopWatchTimer.onStartTimer();
    super.initState();
  }

  @override
  void dispose() {
    stopWatchTimer.dispose();
    super.dispose();
  }

  /// change is send value
  void changeIsSend() {
    _forgetPasswordModelView.changeIsSend();
  }

  void displaySecond() {}
  void setSecond(int? value) {
    if (value != null) {
      _forgetPasswordModelView.setSecond(value);
    }
  }

  void reStartTimer() {
    changeSetWatchSecond(60);
    _forgetPasswordModelView.setSecond(60);
    stopWatchTimer
      ..onResetTimer()
      ..onStartTimer();
  }

  void changeSetWatchSecond(int value) {
    stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: StopWatchTimer.getMilliSecFromSecond(value),
    );
  }
}
