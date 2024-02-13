import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_notification_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/cubit/profile_notification_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/state/profile_notification_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin ProfileNotificationMixin on BaseState<ProfileNotificationView> {
  late final ProfileNotificationBloc _profileNotificationBloc;

  /// View Model Getter
  ProfileNotificationBloc get profileNotificationBloc =>
      _profileNotificationBloc;

  @override
  void initState() {
    _profileNotificationBloc = ProfileNotificationBloc();
    _profileNotificationBloc.changeList(
      [
        DataModel(
          title: 'Bordro İtiraz talebi',
          subTitle: 'İtiraz Talebi Onaylandı',
          isCheck: false,
          isRead: false,
        ),
        DataModel(
          title: 'Shift değişiklik talebi',
          subTitle: 'Shift değişiklik talebin onaylandı',
          isCheck: false,
          isRead: false,
        ),
        DataModel(
          title: 'İzin talebi',
          subTitle: 'İzin talebin onaylandı',
          isCheck: false,
          isRead: true,
        ),
        DataModel(
          title: 'Avans talebi',
          subTitle: 'Avans talebin onaylandı',
          isCheck: false,
          isRead: true,
        ),
        DataModel(
          title: 'Bordro İtiraz talebi 2',
          subTitle: 'İtiraz Talebi Onaylandı',
          isCheck: false,
          isRead: true,
        ),
      ],
    );
    super.initState();
  }

  /// Hide Keyboard
  void hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
