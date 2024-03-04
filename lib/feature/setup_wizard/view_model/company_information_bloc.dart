import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/state/company_information_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// Company Information state management class
class CompanyInformationBloc extends BaseCubit<CompanyInformationState> {
  ///
  CompanyInformationBloc()
      : super(
          const CompanyInformationState(
            groupValue: 0,
            isShow: false,
          ),
        );

  void changeRadio(int value) {
    emit(state.copyWith(groupValue: value));
  }

  void changeIsShow({required bool value}) {
    emit(state.copyWith(isShow: value));
  }

  void changeSectorName(String value) {
    emit(state.copyWith(sectorName: value));
  }
}
