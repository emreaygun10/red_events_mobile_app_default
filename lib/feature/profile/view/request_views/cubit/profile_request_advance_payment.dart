import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/state/profile_request_advance_payment_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// Profile Education state management class
class ProfileRequestAdvancePaymentBloc
    extends BaseCubit<ProfileRequestAdvancePaymentState> {
  ///
  ProfileRequestAdvancePaymentBloc()
      : super(
          const ProfileRequestAdvancePaymentState(
            isLoading: false,
            isEnable: false,
          ),
        );

  /// change value obscure
  void changePaymentAmount(String value) {
    emit(
      state.copyWith(
        paymentAmount: value,
      ),
    );
  }

  /// change value obscure
  void changeIsEnable({required bool isEnable}) {
    emit(
      state.copyWith(
        isEnable: isEnable,
      ),
    );
  }
}
