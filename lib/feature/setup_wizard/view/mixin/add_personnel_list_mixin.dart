import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/peronnel_model.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/add_personnel_list_view.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/add_personnel_list_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin AddPersonnelListMixin on BaseState<AddPersonnelListView> {
  late final AddPersonnelListBloc addPersonnelListBloc;
  late final List<PersonnelModel> personnelList;
  @override
  void initState() {
    addPersonnelListBloc = AddPersonnelListBloc();
    personnelList = [];
    super.initState();
  }
}
