import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/weakly_views/weakly_shift_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/bloc/weakly_shift_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin WeaklyShiftMixin on BaseState<WeaklyShiftView> {
  late final WeaklyShiftBloc weaklyShiftBloc;
  @override
  void initState() {
    weaklyShiftBloc = WeaklyShiftBloc();
    super.initState();
  }
}
