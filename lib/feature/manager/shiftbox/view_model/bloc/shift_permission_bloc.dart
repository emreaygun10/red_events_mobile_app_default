import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/state/shift_permission_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

class ShiftPermissionBloc extends BaseCubit<ShiftPermissionState> {
  ShiftPermissionBloc()
      : super(
          const ShiftPermissionState(
            formType: false,
            sendNotification: false,
            openSecondForm: false,
          ),
        );

  /// For change form type
  void changeFormType(bool value) {
    emit(
      state.copyWith(
        formType: value,
        sendNotification: false,
        openSecondForm: false,
      ),
    );
  }

  void changeSendNotification(bool value) {
    emit(state.copyWith(sendNotification: value));
  }

  void openOrCloseSecondForm() {
    emit(state.copyWith(openSecondForm: !state.openSecondForm));
  }
}
