import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/state/personnel_card_state.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/peronnel_model.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

class PersonnelCardBloc extends BaseCubit<PersonnelCardState> {
  PersonnelCardBloc()
      : super(
          const PersonnelCardState(),
        );

  void changePersonnelCard(PersonnelModel personnelModel) {
    emit(state.copyWith(personnelModel: personnelModel));
  }
}
