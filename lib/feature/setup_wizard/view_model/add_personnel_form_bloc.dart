import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/state/add_personnel_form_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// Add Personnel Form state management class
class AddPersonnelFormBloc extends BaseCubit<AddPersonnelFormState> {
  ///
  AddPersonnelFormBloc()
      : super(
          const AddPersonnelFormState(
            isStartDate: false,
          ),
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
  void changetc(String tcNo) {
    emit(state.copyWith(tcNo: tcNo));
  }

  /// change phone
  void changePhone(String phone) {
    emit(state.copyWith(phoneNumber: phone));
  }

  /// if start date is selected, it will be true
  void changeIsStartDate() {
    emit(state.copyWith(isStartDate: !state.isStartDate));
  }

  /// selected work type
  void changeWorkType(String value) {
    emit(state.copyWith(workType: value));
  }

  ///selected part
  void changePart(String value) {
    emit(state.copyWith(part: value));
  }

  /// selected mission
  void changeMission(String value) {
    emit(state.copyWith(mission: value));
  }

  /// change salary
  void changeSalary(String value) {
    emit(state.copyWith(salary: value));
  }

  /// change selected birtdate
  void changeBirtDate(String value) {
    emit(state.copyWith(birthdate: value));
  }

  /// change selected start date
  void changeStartDate(String value) {
    emit(state.copyWith(startDate: value));
  }
}
