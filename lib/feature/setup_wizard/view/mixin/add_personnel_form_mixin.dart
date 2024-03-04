import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/mixin/hr_informations_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/add_personnel_form_view.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/add_personnel_form_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

mixin AddPersonnelFormMixin on BaseState<AddPersonnelFormView> {
  late final SolidController bottomSheetController;
  late final TextEditingController nameSurnameController;
  late final TextEditingController tcController;
  late final TextEditingController birthdateController;
  late final TextEditingController startDateController;
  late final TextEditingController mailController;
  late final TextEditingController phoneNumberController;
  late final AddPersonnelFormBloc addPersonnelFormBloc;

  List<String> partList = [
    'Lobi Bar',
    'Resepsion',
    'Bahçe',
  ];
  List<String> missionList = [
    'Garson',
    'Aşçı',
    'Barmen',
  ];
  List<String> workTypeList = [
    'Tam Zamanlı',
    'Part Time',
    'Stajyer',
  ];
  List<String> departmentList = [
    'Yemek',
    'Ulaşım',
    'Hizmet',
  ];

  /// Currency items list
  final List<CustomCurrency> currencyList = <CustomCurrency>[
    CustomCurrency(
      currency: 'TRY',
      flag: Assets.icons.icTr.toGetSvg(),
    ),
    CustomCurrency(
      currency: 'EURO',
      flag: Assets.icons.icEu.toGetSvg(),
    ),
    CustomCurrency(
      currency: 'DOLLAR',
      flag: Assets.icons.icUs.toGetSvg(),
    ),
  ];

  /// Phone initial Country
  final String? initialCountry = 'TR';

  @override
  void initState() {
    bottomSheetController = SolidController();
    addPersonnelFormBloc = AddPersonnelFormBloc();
    nameSurnameController = TextEditingController();
    tcController = TextEditingController();
    startDateController = TextEditingController();
    birthdateController = TextEditingController();
    mailController = TextEditingController();
    phoneNumberController = TextEditingController();
    addPersonnelFormBloc
      ..changeWorkType(workTypeList.first)
      ..changeDepartment(departmentList.first)
      ..changePart(partList.first)
      ..changeMission(missionList.first);
    super.initState();
  }
}
