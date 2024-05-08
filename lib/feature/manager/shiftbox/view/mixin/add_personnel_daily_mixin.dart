import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/add_personnel_daily_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/bloc/add_personnel_daily_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/model/daily_personnel_model.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin AddPersonnelDailyMixin on BaseState<AddPersonnelDailyView> {
  late final AddPersonnelDailyBloc addPersonnelDailyBloc;
  late final List<DailyPersonnelModel> addedPersonnelList;
  late final List<DailyPersonnelModel> personnelList;
  @override
  void initState() {
    addPersonnelDailyBloc = AddPersonnelDailyBloc();
    addedPersonnelList = [];
    personnelList = addPersonnelDailyBloc.state.personnelList ?? [];
    super.initState();
  }

  void addPersonnel(DailyPersonnelModel personnel) {
    addPersonnelDailyBloc.changeSelectedPerson(personnel);
    addedPersonnelList.add(
      addPersonnelDailyBloc.state.selectedPerson ?? personnel,
    );
    personnelList.removeWhere(
      (element) => personnel.id == element.id,
    );
    addPersonnelDailyBloc.changeLists(
      addedPersonnelList,
      personnelList,
    );
  }

  void removePersonnel(DailyPersonnelModel personnel) {
    addPersonnelDailyBloc.changeSelectedPerson(personnel);
    personnelList.add(
      addPersonnelDailyBloc.state.selectedPerson ?? personnel,
    );
    addedPersonnelList.removeWhere(
      (element) => personnel.id == element.id,
    );
    addPersonnelDailyBloc.changeLists(
      addedPersonnelList,
      personnelList,
    );
  }
}
