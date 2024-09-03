import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/state/weakly_sihft_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

class WeaklyShiftBloc extends BaseCubit<WeaklyShiftState> {
  WeaklyShiftBloc() : super(const WeaklyShiftState(selectedChip: 0));

  /// For change selected chip
  void changeChip(int value) {
    emit(state.copyWith(selectedChip: value));
  }
}
