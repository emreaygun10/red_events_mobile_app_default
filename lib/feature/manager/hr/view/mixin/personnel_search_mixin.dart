import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/view/personnel_search_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/personnel_search_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/peronnel_model.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin PersonnelSearchMixin on BaseState<PersonnelSearchView> {
  late final TextEditingController searchTextController;
  late final PersonnelSearchBloc personnelSearchBloc;
  late final List<PersonnelModel> tempList;

  @override
  void initState() {
    searchTextController = TextEditingController();
    personnelSearchBloc = PersonnelSearchBloc();
    tempList = personnelSearchBloc.state.personnelList!;
    super.initState();
  }

  void listFilter(String text) {
    personnelSearchBloc.changePersonnelList(
      tempList
          .where(
            (element) => element.nameSurname.toLowerCase().contains(
                  text.toLowerCase(),
                ),
          )
          .toList(),
    );
    personnelSearchBloc.changeText(searchTextController.text);
  }
}
