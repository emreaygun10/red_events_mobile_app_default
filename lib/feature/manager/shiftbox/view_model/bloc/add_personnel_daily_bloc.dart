import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/model/daily_personnel_model.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/state/add_peronnel_daily_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

class AddPersonnelDailyBloc extends BaseCubit<AddPersonnelDailyState> {
  AddPersonnelDailyBloc()
      : super(
          AddPersonnelDailyState(
            personnelList: [
              DailyPersonnelModel(
                id: 0,
                name: 'Floyd',
                surname: 'Miles',
                age: 24,
                phoneNumber: '',
                job: 'FT',
                title: 'Garson',
              ),
              DailyPersonnelModel(
                id: 1,
                name: 'Kathryn',
                surname: 'Murphy',
                age: 24,
                phoneNumber: '',
                job: 'FT',
                title: 'Garson',
              ),
              DailyPersonnelModel(
                id: 2,
                name: 'Savannah',
                surname: 'Nguyen',
                age: 22,
                phoneNumber: '',
                job: 'FT',
                title: 'Garson',
              ),
              DailyPersonnelModel(
                id: 3,
                name: 'Jacob',
                surname: 'Jones',
                age: 21,
                phoneNumber: '',
                job: 'FT',
                title: 'Garson',
              ),
              DailyPersonnelModel(
                id: 4,
                name: 'Sophia',
                surname: 'Willams',
                age: 22,
                phoneNumber: '',
                job: 'FT',
                title: 'Garson',
              ),
            ],
          ),
        );

  void changeLists(
    List<DailyPersonnelModel> addedPersonnelList,
    List<DailyPersonnelModel> personnelList,
  ) {
    emit(
      state.copyWith(
        addedPersonnelList: addedPersonnelList,
        personnelList: personnelList,
      ),
    );
  }

  void changeSelectedPerson(DailyPersonnelModel dailyPersonnel) {
    final tempPerson = dailyPersonnel.copyWith(
      isAdded: !dailyPersonnel.isAdded,
    );

    emit(
      state.copyWith(selectedPerson: tempPerson),
    );
  }

  void changeSelectedChip(int value) {
    emit(state.copyWith(selectedChip: value));
  }
}
