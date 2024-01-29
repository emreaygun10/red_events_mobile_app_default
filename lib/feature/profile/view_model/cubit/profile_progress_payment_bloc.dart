import 'package:red_events_mobile_app_defult/feature/profile/view_model/state/profile_progress_payment_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// Profile Progress Payment state management class
class ProfileProgressPaymentBloc
    extends BaseCubit<ProfileProgressPaymentState> {
  ///
  ProfileProgressPaymentBloc()
      : super(
          const ProfileProgressPaymentState(
            isLoading: false,
            chipIndex: true,
            isEmptyBordro: true,
          ),
        );

  /// change value obscure
  void changeChipIndex() {
    emit(state.copyWith(chipIndex: !state.chipIndex));
  }
}
