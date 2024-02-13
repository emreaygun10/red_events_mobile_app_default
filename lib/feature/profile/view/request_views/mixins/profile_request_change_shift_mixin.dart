import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/cubit/profile_request_change_shift_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/profile_request_change_shift_view.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

mixin ProfileRequestChangeShiftMixin
    on BaseState<ProfileRequestChangeShiftView> {
  late final ProfileRequestChangeShiftBloc profileRequestChangeShiftBloc;
  late final SolidController solidDayController;
  late final SolidController solidManagerController;

  String? textBoxString;
  String? textDayBoxString;

  @override
  void initState() {
    profileRequestChangeShiftBloc = ProfileRequestChangeShiftBloc(
      managerList: [
        'Aydanur Evrener',
        'Emre Aygün',
        'Ellen Rose',
        'Jerome Bell',
      ],
      dayList: [
        'Pazartesi',
        'Salı',
        'Çarşamba',
      ],
    );
    solidDayController = SolidController();
    solidManagerController = SolidController();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: add managers list
    super.didChangeDependencies();
  }

  final TextEditingController textEditingControllerExplanation =
      TextEditingController();

  final TextEditingController textEditingControllerManagerType =
      TextEditingController();

  final TextEditingController textEditingControllerDayType =
      TextEditingController();

  ///add manager
  void addManager(String manager) {
    final result = profileRequestChangeShiftBloc.addManagerList(manager);
    if (result) {
      if (textBoxString.ext.isNullOrEmpty) {
        textBoxString = manager;
      } else {
        if (!textBoxString!.contains(manager)) {
          textBoxString = '$textBoxString - $manager';
        }
      }
    }
  }

  ///add manager
  void addDays(String day) {
    final result = profileRequestChangeShiftBloc.addDayList(day);
    if (result) {
      textDayBoxString = LocaleKeys.profile_change_shift_counter_date_text.tr(
        args: [
          profileRequestChangeShiftBloc.state.dayCheckBoxList.length.toString(),
        ],
      );
    }
  }

  void removeDays(String day) {
    profileRequestChangeShiftBloc.removeDayList(day);
    textDayBoxString = LocaleKeys.profile_change_shift_counter_date_text.tr(
      args: [
        profileRequestChangeShiftBloc.state.dayCheckBoxList.length.toString(),
      ],
    );
  }

  ///remove manager
  void removeManager(String manager) {
    profileRequestChangeShiftBloc.removeManagerList(manager);
    if (textBoxString != null) {
      if (textBoxString!.contains('- $manager -')) {
        textBoxString = textBoxString!.replaceAll('- $manager -', '');
      } else if (textBoxString!.contains('- $manager')) {
        textBoxString = textBoxString!.replaceAll(' - $manager', '');
      } else if (textBoxString!.contains('$manager -')) {
        textBoxString = textBoxString!.replaceAll('$manager - ', '');
      } else if (textBoxString!.contains(manager)) {
        textBoxString = textBoxString!.replaceAll(manager, '');
      }
    }
  }

  ///if bottom sheet is open,
  void dayBottomSheetOpenOrHide() {
    if (solidDayController.isOpened) {
      solidDayController.hide();
    } else {
      solidDayController.show();
    }
  }

  ///if bottom sheet is open,
  void managerBottomSheetOpenOrHide() {
    if (solidManagerController.isOpened) {
      solidManagerController.hide();
    } else {
      solidManagerController.show();
    }
  }
}
