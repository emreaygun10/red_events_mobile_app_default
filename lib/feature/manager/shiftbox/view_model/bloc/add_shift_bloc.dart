import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/state/add_shift_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/manager_enum.dart';

class AddShiftBloc extends BaseCubit<AddShiftState> {
  AddShiftBloc()
      : super(
          const AddShiftState(
            addShiftEnums: AddShiftEnums.type,
            personelCounter: 0,
            isRepeat: false,
          ),
        );

  /// For change selected date
  void changeSelectedContainer(AddShiftEnums value) {
    emit(state.copyWith(addShiftEnums: value));
  }

  /// Increase value
  void changePersonelCounterIncrease() {
    emit(state.copyWith(personelCounter: state.personelCounter + 1));
  }

  /// Decrease value
  void changePersonelCounterDecrease() {
    emit(state.copyWith(personelCounter: state.personelCounter - 1));
  }

  void changeSelectedDate(DateTime selectedDate) {
    emit(state.copyWith(selectedDate: selectedDate));
  }

  void changeIsRepeat({required bool value}) {
    emit(state.copyWith(isRepeat: value));
  }

  void changeEndDate(DateTime endDate) {
    emit(state.copyWith(endDate: endDate));
  }
}
