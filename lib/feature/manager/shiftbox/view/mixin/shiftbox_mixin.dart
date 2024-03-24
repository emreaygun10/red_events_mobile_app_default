import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/shiftbox_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/bloc/shiftbox_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

mixin ShiftboxMixin on BaseState<ShiftBoxView> {
  late final ShiftBoxBloc _shiftBoxBloc;
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
  DateTime get selectedDate => _shiftBoxBloc.state.selectedMonth;

  ShiftBoxBloc get shiftBoxBloc => _shiftBoxBloc;
  @override
  void initState() {
    _shiftBoxBloc = ShiftBoxBloc();
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
      _shiftBoxBloc.changeMonth(DateTime.now());
    } else {
      _shiftBoxBloc.changeMonth(date);
    }
  }

  /// One month subtract
  void subtractDate() {
    if (!_shiftBoxBloc.state.selectedMonth.isBefore(minDate)) {
      _shiftBoxBloc.changeMonth(
        Jiffy.parse(_shiftBoxBloc.state.selectedMonth.toString())
            .subtract(months: 1)
            .dateTime,
      );
    }
  }

  /// One month subtract
  void addDate() {
    if (!_shiftBoxBloc.state.selectedMonth.isAfter(maxDate)) {
      _shiftBoxBloc.changeMonth(
        Jiffy.parse(_shiftBoxBloc.state.selectedMonth.toString())
            .add(months: 1)
            .dateTime,
      );
    }
  }
}
