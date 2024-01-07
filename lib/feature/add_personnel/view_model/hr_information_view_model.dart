import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/state/hr_information_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/linearprogress_enums.dart';

/// Add Personnel state management class
class HrInformationCubit extends BaseCubit<HrInformationState> {
  ///
  HrInformationCubit()
      : super(
          const HrInformationState(
            isLoading: false,
            departmentFocus: false,
            partFocus: false,
            sectionFocus: false,
            startedDateFocus: false,
            workTypeFocus: false,
            linearProgressEnum: LinearProgressEnum.levelTwo,
          ),
        );

  /// change bool values part

  /// change value idLoading
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// change value departmentFocus
  void changeDepartmentFocus({required bool value}) {
    emit(state.copyWith(departmentFocus: value));
  }

  /// change value partFocus
  void changePartFocus({required bool value}) {
    emit(state.copyWith(partFocus: value));
  }

  /// change value sectionFocus
  void changeSectionFocus({required bool value}) {
    emit(state.copyWith(sectionFocus: value));
  }

  /// change value workTypeFocus
  void changeWorkTypeFocus({required bool value}) {
    emit(state.copyWith(workTypeFocus: value));
  }

  /// change value startedDateFocus
  void changeStartedFocus({required bool value}) {
    emit(state.copyWith(startedDateFocus: value));
  }

  void changeLinearProgress(LinearProgressEnum linearProgressEnum) {
    emit(state.copyWith(linearProgressEnum: linearProgressEnum));
  }
}
