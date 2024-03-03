import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/state/work_type_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// Work Type state management class
class WorkTypeBloc extends BaseCubit<WorkTypeState> {
  WorkTypeBloc()
      : super(
          const WorkTypeState(
            switchIsEnable: false,
            clock: 8,
            questionOne: -1,
            questionTwo: -1,
            questionThree: -1,
            isDisable: false,
          ),
        );

  void changeSwitchIsEnable(bool isEmpty) {
    emit(state.copyWith(switchIsEnable: isEmpty));
  }

  void changeIsDisable(bool button) {
    emit(state.copyWith(isDisable: button));
  }

  void changeClock(int clock) {
    if (clock > 0) {
      emit(state.copyWith(clock: clock));
    }
  }

  void changeQuestionOne(int questionOne) {
    emit(state.copyWith(questionOne: questionOne));
  }

  void changeQuestionTwo(int questionTwo) {
    emit(state.copyWith(questionTwo: questionTwo));
  }

  void changeQuestionThree(int questionThree) {
    emit(state.copyWith(questionThree: questionThree));
  }
}
