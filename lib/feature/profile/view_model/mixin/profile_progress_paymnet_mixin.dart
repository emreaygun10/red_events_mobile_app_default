import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_progress_payment_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/cubit/profile_progress_payment_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

mixin ProfileProgressPaymentMixin on BaseState<ProfileProgressPaymentView> {
  late final ProfileProgressPaymentBloc _profileProgressPaymentBloc;
  DateRangePickerController datePickerController = DateRangePickerController();
  String selectedDateString = Jiffy.now().format(pattern: 'MMMM y');
  final DateTime minDate = DateTime(
    DateTime.now().year - 1,
    DateTime.now().month,
    DateTime.now().day,
  );
  final DateTime maxDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime get selectedDate => _profileProgressPaymentBloc.state.selectedMonth;

  /// View Model Getter
  ProfileProgressPaymentBloc get profileProgressPaymentBloc =>
      _profileProgressPaymentBloc;

  @override
  void initState() {
    _profileProgressPaymentBloc = ProfileProgressPaymentBloc();
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

  /// Fix date with Jiffy
  void fixDateFormat(DateTime date) {
    selectedDateString = Jiffy.parse(date.toString()).format(pattern: 'MMMM y');
  }

  /// Change Date with min max control
  void changeDate(DateTime date) {
    if (date.isBefore(minDate) || date.isAfter(maxDate)) {
      _profileProgressPaymentBloc.changeMonth(DateTime.now());
    } else {
      _profileProgressPaymentBloc.changeMonth(date);
    }
  }

  /// One month subtract
  void subtractDate() {
    if (!_profileProgressPaymentBloc.state.selectedMonth.isBefore(minDate)) {
      _profileProgressPaymentBloc.changeMonth(
        Jiffy.parse(_profileProgressPaymentBloc.state.selectedMonth.toString())
            .subtract(months: 1)
            .dateTime,
      );
    }
  }

  /// One month subtract
  void addDate() {
    if (!_profileProgressPaymentBloc.state.selectedMonth.isAfter(maxDate)) {
      _profileProgressPaymentBloc.changeMonth(
        Jiffy.parse(_profileProgressPaymentBloc.state.selectedMonth.toString())
            .add(months: 1)
            .dateTime,
      );
    }
  }
}
