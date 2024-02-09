import 'package:fluttertoast/fluttertoast.dart';
import 'package:red_events_mobile_app_defult/feature/home/view/home_view.dart';
import 'package:red_events_mobile_app_defult/feature/home/wiew_model/home_view_model.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_success_toast.dart';

mixin HomeViewMixin on BaseState<HomeView> {
  late final FToast fToast;
  late final HomeViewModel homeViewModel;
  @override
  void initState() {
    homeViewModel = HomeViewModel();
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  /// Show success toast with message on bottom screen
  void showSuccessToast(String message) {
    fToast.showToast(
      child: CustomSuccessToast(
        message: message,
      ),
    );
  }
}
