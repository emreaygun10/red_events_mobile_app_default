import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/cubit/profile_request_others_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/profile_request_others_view.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin ProfileRequestOtherMixin on BaseState<ProfileRequestOthersView> {
  late final ProfileRequestOthersBloc _profileRequestOtherBloc;

  ProfileRequestOthersBloc get profileRequestOtherBloc =>
      _profileRequestOtherBloc;
  @override
  void initState() {
    _profileRequestOtherBloc = ProfileRequestOthersBloc();
    super.initState();
  }

  TextEditingController textEditingControllerExplanation =
      TextEditingController();
}
