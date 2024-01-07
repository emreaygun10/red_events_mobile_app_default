import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/state/add_personnel_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// Add Personnel state management class
class AddPersonnelViewModel extends BaseCubit<AddPersonnelState> {
  ///
  AddPersonnelViewModel()
      : super(
          const AddPersonnelState(
            isLoading: false,
            isObscure: true,
            nameSurnameFocus: false,
            birthDateFocus: false,
            cityFocus: false,
            neighborhoodFocus: false,
            phoneNumberFocus: false,
            tcFocus: false,
            isImageSelected: false,
          ),
        );

  void changePhoneNumber({
    required String countryCode,
    required String phoneNumber,
    required String dialCode,
  }) {
    emit(
      state.copyWith(
        phoneNumber: PhoneNumber(
          countryISOCode: countryCode,
          countryCode: dialCode,
          number: phoneNumber,
        ),
      ),
    );
  }

  /// change bool values part
  /// change value obscure
  void changeObscure() {
    emit(state.copyWith(isObscure: !state.isObscure));
  }

  /// change value isImage Selected
  void changeIsImageSelected(bool value) {
    emit(state.copyWith(isImageSelected: value));
  }

  /// change value idLoading
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// change value NameSurnameFocus
  void changeNameSurnameFocus({required bool value}) {
    emit(state.copyWith(nameSurnameFocus: value));
  }

  /// change value TcFocus
  void changeTcFocus({required bool value}) {
    emit(state.copyWith(tcFocus: value));
  }

  /// change value BirthDate
  void changeBirthDateFocus({required bool value}) {
    emit(state.copyWith(birthDateFocus: value));
  }

  /// change value idLoading
  void changePhoneNumberFocus({required bool value}) {
    emit(state.copyWith(phoneNumberFocus: value));
  }

  /// change value City focus
  void changeCityFocus({required bool value}) {
    emit(state.copyWith(cityFocus: value));
  }

  /// change value idLoading
  void changeNeighborhoodFocus({required bool value}) {
    emit(state.copyWith(neighborhoodFocus: value));
  }

  /// Change image file
  void assigmentImageToFile(XFile xFile) {
    emit(state.copyWith(imageFile: File(xFile.path)));
  }

  /// company name setter
  void setCompanyName(String name) {
    emit(state.copyWith(companyName: name));
  }

  /// company mail setter
  void setCompanyMail(String mail) {
    emit(state.copyWith(mail: mail));
  }

  /// password setter
  void setPassword(String password) {
    emit(state.copyWith(password: password));
  }
}
