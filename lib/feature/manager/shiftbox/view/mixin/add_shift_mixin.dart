import 'package:easy_localization/easy_localization.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/add_shift_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/bloc/add_shift_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/model/day_model.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

mixin AddShiftmixin on BaseState<AddShiftView> {
  late final SolidController bottomSheetController;
  late final AddShiftBloc addShiftBloc;
  late final DateRangePickerController dateRangePickerController;
  DateFormat inputFormat = DateFormat('dd-MM-yyyy');
  late final List<DayModel> days;

  @override
  void initState() {
    super.initState();
    addShiftBloc = AddShiftBloc();
    bottomSheetController = SolidController();
    dateRangePickerController = DateRangePickerController();
    days = [
      DayModel(day: 'Pazartesi'),
      DayModel(day: 'Salı'),
      DayModel(day: 'Çarşamba'),
      DayModel(day: 'Perşembe'),
      DayModel(day: 'Cuma'),
      DayModel(day: 'Cumartesi'),
      DayModel(day: 'Pazar'),
    ];
  }

  void changeDate(DateTime dateTime) {
    addShiftBloc.changeSelectedDate(dateTime);
  }

  String? displayDate(DateTime? date) {
    if (date == null) {
      return null;
    } else {
      return DateFormat('dd.MM.yyyy').format(date);
    }
  }
}
