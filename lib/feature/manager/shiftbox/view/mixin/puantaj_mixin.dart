import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/puantaj/puantaj_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/bloc/puantaj_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

mixin PuantajMixin on BaseState<PuantajView> {
  late final PuantajBloc puantajBloc;
  late final DateRangePickerController dateRangePickerController;
  @override
  void initState() {
    puantajBloc = PuantajBloc();
    dateRangePickerController = DateRangePickerController();
    super.initState();
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    dateRangePickerController.selectedDate = args.value as DateTime;
    puantajBloc.changeSelectedDate(args.value as DateTime);
  }

  void addWeeak(DateTime date, int week) {
    var newDate = date;
    while (newDate.weekday != 1) {
      newDate = newDate.add(const Duration(days: -1));
    }
    puantajBloc.changeSelectedDate(newDate.addWeeks(week));
    dateRangePickerController.selectedDate = puantajBloc.state.selectedDate;
  }

  void addMonth(int mounth) {
    puantajBloc.changeSelectedDate(
      puantajBloc.state.selectedDate.addMonths(mounth),
    );
    dateRangePickerController.selectedDate = puantajBloc.state.selectedDate;
    dateRangePickerController.displayDate =
        dateRangePickerController.selectedDate;
  }

  void changeWeeaklyDate(DateTime value) {
    puantajBloc.changeSelectedDate(value);
    dateRangePickerController.selectedDate = puantajBloc.state.selectedDate;
  }
}
