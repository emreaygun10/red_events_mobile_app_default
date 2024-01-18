import 'package:red_events_mobile_app_defult/feature/profile/view_model/state/bottom_sheet_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// Profile Education state management class
class BottomSheetBloc extends BaseCubit<BottomSheetState> {
  ///
  BottomSheetBloc()
      : super(
          const BottomSheetState(
            isLoading: false,
            groupIndex: 1,
          ),
        );

  /// change value obscure
  void changeGroupIndex(int? index) {
    emit(state.copyWith(groupIndex: index));
  }
}
