import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_notification_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/cubit/profile_notification_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/state/profile_notification_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin ProfileNotificationMixin on BaseState<ProfileNotificationView> {
  late final ProfileNotificationBloc profileNotificationBloc;

  /// View Model Getter

  @override
  void initState() {
    profileNotificationBloc = ProfileNotificationBloc();
    profileNotificationBloc
      ..changeList(
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
      )
      ..changeTempList(profileNotificationBloc.state.data!);

    super.initState();
  }

  /// assign data to temp list with switch and change chip switch
  void assignTempList(int index) {
    switch (index) {
      case 0:
        profileNotificationBloc
          ..changeChipIndex(index)
          ..changeTempList(profileNotificationBloc.state.data!);

      case 1:
        profileNotificationBloc
          ..changeChipIndex(index)
          ..changeTempList(
            profileNotificationBloc.state.data!
                .where((element) => element.isRead == false)
                .toList(),
          );

      case 2:
        profileNotificationBloc
          ..changeChipIndex(index)
          ..changeTempList(
            profileNotificationBloc.state.data!
                .where((element) => element.isRead == true)
                .toList(),
          );
    }
  }

  /// Hide Keyboard
  void hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void changeModelInList({required DataModel model, required bool value}) {
    profileNotificationBloc.changeModelInList(model: model, value: value);
    assignTempList(profileNotificationBloc.state.chipIndex);
  }

  void selectedDelete() {
    profileNotificationBloc
      ..selectedElementDelete()
      ..changeIsLongPress(value: false);
    assignTempList(profileNotificationBloc.state.chipIndex);
  }
}
