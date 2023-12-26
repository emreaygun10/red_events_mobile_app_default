import 'package:red_events_mobile_app_defult/feature/auth/onboard/view/onboard_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/onboard/view_model/onboard_view_model.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin OnboardMixin on BaseState<OnboardView> {
  late final OnboardViewModel _onboardViewModel;

  /// MOdel view getter
  OnboardViewModel get onboardViewModel => _onboardViewModel;
  @override
  void initState() {
    super.initState();

    _onboardViewModel = OnboardViewModel();
  }
}
