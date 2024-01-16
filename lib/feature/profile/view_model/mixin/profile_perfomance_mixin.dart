import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_performance_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/cubit/profile_performance_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin ProfilePerfomanceMixin on BaseState<ProfilePerformanceView> {
  late final ProfilePerformanceBloc _profilePerformanceBloc;

  /// View Model Getter
  ProfilePerformanceBloc get profilePerformanceBloc => _profilePerformanceBloc;

  final currentYear = DateTime.now().year;

  @override
  void initState() {
    _profilePerformanceBloc = ProfilePerformanceBloc();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Hide Keyboard
  void hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
