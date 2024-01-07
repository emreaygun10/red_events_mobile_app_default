import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view/hr_informations_view.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/add_personnel_view_model.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin HrInformationMixin on BaseState<HrInformationView> {
  late final AddPersonnelViewModel _addPersonnelViewModel;

  /// View Model Getter
  AddPersonnelViewModel get addPersonnelViewModel => _addPersonnelViewModel;

  /// Form Global Key
  final GlobalKey<FormState> formKey = GlobalKey();

  /// Text editing controller nameSurname controller
  final TextEditingController nameSurnameEditingController =
      TextEditingController();

  /// Text editing controller tcNo  controller
  final TextEditingController tcNoEditingController = TextEditingController();

  /// Text editing controller birthDate controller
  final TextEditingController birthDateEditingController =
      TextEditingController();

  /// FormFocusNodes
  final List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    _addPersonnelViewModel = AddPersonnelViewModel();

    for (final focusNode in focusNodes) {
      focusNode.addListener(() {
        addPersonnelViewModel
          ..changeNameSurnameFocus(value: focusNodes[0].hasFocus)
          ..changeTcFocus(value: focusNodes[1].hasFocus)
          ..changeBirthDateFocus(value: focusNodes[2].hasFocus)
          ..changePhoneNumberFocus(value: focusNodes[3].hasFocus)
          ..changeCityFocus(value: focusNodes[4].hasFocus)
          ..changeNeighborhoodFocus(value: focusNodes[5].hasFocus);
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    for (final focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  set changeName(String name) {
    _addPersonnelViewModel.setCompanyName(name);
  }

  set changeMail(String mail) {
    _addPersonnelViewModel.setCompanyMail(mail);
  }

  /// Todo Furure<bool>
  void postLogin() {
    if (formKey.currentState?.validate() ?? false) {
      /// TODO: send to service
    } else {}
  }

  /// jump page to page with PageView controller
}
