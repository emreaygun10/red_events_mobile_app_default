import 'package:fluttertoast/fluttertoast.dart';
import 'package:red_events_mobile_app_defult/feature/home/view/home_view.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

mixin HomeViewMixin on BaseState<HomeView> {
  late final FToast fToast;
  @override
  void initState() {
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  /// Show success toast with message on bottom screen
  void showSuccessToast(String message) {
    fToast.showToast(
        child: SuccessToast(
      message: message,
    ));
  }
}
