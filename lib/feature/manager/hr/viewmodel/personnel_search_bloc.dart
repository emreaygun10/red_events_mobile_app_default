import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/state/personnel_search_state.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/peronnel_model.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

class PersonnelSearchBloc extends BaseCubit<PersonnelSearchState> {
  PersonnelSearchBloc()
      : super(
          PersonnelSearchState(
            isTextNull: true,
            personnelList: [
              PersonnelModel(
                nameSurname: 'Başak Yılmaz Güven',
                tcNo: '12312312311',
                birthdate: '22/10/2000',
                mail: '',
                phoneNumber: '',
                workType: 'FT',
                department: 'Food & Beverage',
                part: 'Lobi Bar',
                mission: 'Garson',
                startDate: '22/10/2023',
                salary: '15.000',
              ),
              PersonnelModel(
                nameSurname: 'Başak Yılmaz Güven',
                tcNo: '12312312311',
                birthdate: '22/10/2000',
                mail: '',
                phoneNumber: '',
                workType: 'FT',
                department: 'Food & Beverage',
                part: 'Lobi Bar',
                mission: 'Garson',
                startDate: '22/10/2023',
                salary: '15.000',
              ),
            ],
          ),
        );

  /// change Personnel List
  void changePersonnelList(List<PersonnelModel> list) {
    emit(state.copyWith(personnelList: list));
  }

  /// text is Null
  void changeTextNull({required bool value}) {
    emit(state.copyWith(isTextNull: value));
  }

  /// text
  void changeText(String? value) {
    emit(state.copyWith(text: value));
  }
}
