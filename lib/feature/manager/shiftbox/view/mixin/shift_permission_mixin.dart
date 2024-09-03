import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/shift_permission_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/bloc/shift_permission_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin ShiftPermissionMixin on BaseState<ShiftPermissionView> {
  late final ShiftPermissionBloc shiftPermissionBloc;
  @override
  void initState() {
    shiftPermissionBloc = ShiftPermissionBloc();
    super.initState();
  }
}
