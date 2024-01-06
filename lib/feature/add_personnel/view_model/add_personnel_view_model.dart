import 'dart:io';

import 'package:image_picker/image_picker.dart';
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
            passwordFocus: false,
            isImageSelected: false,
          ),
        );

  /// Changer focus node hasFocus value in state
  void changePasswordFocusNodeHasFocus(bool value) {
    emit(state.copyWith(passwordFocus: value));
  }

  /// change value obscure
  void changeObscure() {
    emit(state.copyWith(isObscure: !state.isObscure));
  }

  /// change value isImage Selected
  void changeIsImageSelected(bool value) {
    emit(state.copyWith(isImageSelected: value));
  }

  void assigmentImageToFile(XFile xFile) {
    emit(state.copyWith(imageFile: File(xFile.path)));
  }

  /// change value idLoading
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
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
