import 'package:fluttertoast/fluttertoast.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/progress_payment_views/progress_payment_document_read_view.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_success_toast.dart';

mixin PrgressPaymentDocumentReadMixin
    on BaseState<ProgressPaymentDocumentReadView> {
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
      child: CustomSuccessToast(
        height: 45,
        message: message,
      ),
    );
  }
}
