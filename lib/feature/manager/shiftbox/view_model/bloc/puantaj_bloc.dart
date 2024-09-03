import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/state/puantaj_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

class PuantajBloc extends BaseCubit<PuantajState> {
  PuantajBloc()
      : super(
          PuantajState(
            isWeakly: false,
            personnel: 420,
            selectedDate: DateTime.now(),
            totalHours: 1892,
            totalMouth: '861.000,93',
          ),
        );

  void changeCalenderType() {
    emit(state.copyWith(isWeakly: !state.isWeakly));
  }

  void changeSelectedDate(DateTime date) {
    emit(state.copyWith(selectedDate: date));
  }
}
