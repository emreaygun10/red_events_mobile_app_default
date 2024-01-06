import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view/base_informations_view.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/add_personnel_view_model.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin AddPersonnelMixin on BaseState<BaseInformationView> {
  late final AddPersonnelViewModel _addPersonnelViewModel;
  late final FocusNode passwordFocusNode;

  /// View Model Getter
  AddPersonnelViewModel get addPersonnelViewModel => _addPersonnelViewModel;

  /// Form Global Key
  final GlobalKey<FormState> formKey = GlobalKey();

  /// Text editing controller company name controller
  final TextEditingController nameSurname = TextEditingController();

  /// Text editing controller company mail controller
  final TextEditingController tcNo = TextEditingController();

  /// Text editing controller passwords controller
  final TextEditingController birthDate = TextEditingController();

  @override
  void initState() {
    _addPersonnelViewModel = AddPersonnelViewModel();
    passwordFocusNode = FocusNode()
      ..addListener(() {
        addPersonnelViewModel
            .changePasswordFocusNodeHasFocus(passwordFocusNode.hasFocus);
      });

    super.initState();
  }

  @override
  void dispose() {
    passwordFocusNode.dispose();
    super.dispose();
  }

  /// Hide Keyboard
  void hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
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
}
