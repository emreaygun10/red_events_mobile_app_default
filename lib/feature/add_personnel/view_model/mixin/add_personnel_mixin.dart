import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view/base_informations_view.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/add_personnel_view_model.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

mixin AddPersonnelMixin on BaseState<BaseInformationView> {
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

  /// Text editing controller birthDate controller
  final TextEditingController phoneEditingController = TextEditingController();

  /// Phone initial Country
  final String? initialCountry = 'TR';

  /// Phone initial Country
  final String? initialDialCode = '+90';

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

  void changePassword(String password) {
    _addPersonnelViewModel.setPassword(password);
  }

  /// Todo Furure<bool>
  void postLogin() {
    if (formKey.currentState?.validate() ?? false) {
      /// TODO: send to service
    } else {}
  }

  void changePhoneNumber(PhoneNumber phoneNumber) {
    _addPersonnelViewModel.changePhoneNumber(
      countryCode: phoneNumber.countryISOCode,
      phoneNumber: phoneNumber.number,
      dialCode: phoneNumber.countryCode,
    );
  }

  // Future<File?> getPhotoFromGallery() async {
  //   final selected = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (selected == null) {
  //     _addPersonnelViewModel.changeIsImageSelected(false);
  //     return null;
  //   } else {
  //     _addPersonnelViewModel
  //       ..assigmentImageToFile(selected)
  //       ..changeIsImageSelected(true);
  //   }
  //   return null;
  // }
  Future<File?> getPhoto(ImageSource source) async {
    final selected = await ImagePicker().pickImage(source: source);
    if (selected == null) {
      _addPersonnelViewModel.changeIsImageSelected(false);
      return null;
    } else {
      _addPersonnelViewModel
        ..assigmentImageToFile(selected)
        ..changeIsImageSelected(true);
    }
    return null;
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    birthDateEditingController.text = args.value.toString().split(' ')[0];
    context.router.pop();
  }
}
