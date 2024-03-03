import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/state/add_personnel_form_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// Add Personnel Form state management class
class AddPersonnelFormBloc extends BaseCubit<AddPersonnelFormState> {
  ///
  AddPersonnelFormBloc()
      : super(
          const AddPersonnelFormState(),
        );

  /// change  name
  void changeName(String name) {
    emit(state.copyWith(nameSurname: name));
  }

  /// change department
  void changeDepartment(String department) {
    emit(state.copyWith(department: department));
  }

  /// change mail
  void changeManagerMail(String mail) {
    emit(state.copyWith(mail: mail));
  }

  /// change tcNo
  void changeManagerPhone(String tcNo) {
    emit(state.copyWith(tcNo: tcNo));
  }

  /// change phone
  void changePhone(String phone) {
    emit(state.copyWith(phoneNumber: phone));
  }
}
