import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/state/base_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

class BaseBloc extends BaseCubit<BaseViewState> {
  BaseBloc() : super(const BaseViewState(pageIndex: 0));

  /// For change selected page
  void changeMonth(int page) {
    emit(state.copyWith(pageIndex: page));
  }
}
