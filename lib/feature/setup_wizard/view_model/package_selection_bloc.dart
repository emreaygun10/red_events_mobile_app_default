import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/state/package_selection_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// Package Selection state management class
class PackageSelectionBloc extends BaseCubit<PackageSelectionState> {
  ///
  PackageSelectionBloc()
      : super(
          const PackageSelectionState(
            groupValue: 0,
          ),
        );

  /// change radio index
  void changeRadio(int value) {
    emit(state.copyWith(groupValue: value));
  }
}
