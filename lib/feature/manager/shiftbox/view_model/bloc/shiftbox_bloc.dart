import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/state/shiftbox_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

class ShiftBoxBloc extends BaseCubit<ShiftBoxState> {
  ShiftBoxBloc() : super(ShiftBoxState(selectedMonth: DateTime.now()));

  /// For change selected date
  void changeMonth(DateTime date) {
    emit(state.copyWith(selectedMonth: date));
  }
}
