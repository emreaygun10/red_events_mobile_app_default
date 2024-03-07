import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/package_selection_view.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/package_selection_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin PackageSelectionMixin on BaseState<PackageSelectionView> {
  late final PackageSelectionBloc packageSelectionBloc;

  @override
  void initState() {
    packageSelectionBloc = PackageSelectionBloc();
    super.initState();
  }
}
