import 'package:flutter/cupertino.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/mixin/hr_informations_mixin.dart';
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
            isPriceInfoBool: false,
            linearProgressEnum: LinearProgressEnum.levelTwo,
          ),
        );

  /// change bool values part
  void changeFocusNodes(List<FocusNode> focusNodes) {
    emit(
      state.copyWith(
        startedDateFocus: focusNodes[0].hasFocus,
        departmentFocus: focusNodes[1].hasFocus,
        sectionFocus: focusNodes[2].hasFocus,
        workTypeFocus: focusNodes[3].hasFocus,
        partFocus: focusNodes[4].hasFocus,
      ),
    );
  }

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

  /// Change linear progress
  void changeLinearProgress(LinearProgressEnum linearProgressEnum) {
    emit(state.copyWith(linearProgressEnum: linearProgressEnum));
  }

  /// change isPriceInfo value
  void changeIsPriceInfo({required bool value}) {
    emit(state.copyWith(isPriceInfoBool: value));
  }

  /// change currency value
  void changeCurrencyValue(CustomCurrency value) {
    emit(state.copyWith(customCurrency: value));
  }
}
