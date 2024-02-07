import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/progress_payment_views/mixin/progress_payment_document_read_mixin.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class ProgressPaymentDocumentReadView extends StatefulWidget {
  const ProgressPaymentDocumentReadView({super.key});

  @override
  State<ProgressPaymentDocumentReadView> createState() =>
      _ProgressPaymentDocumentReadViewState();
}

class _ProgressPaymentDocumentReadViewState
    extends BaseState<ProgressPaymentDocumentReadView>
    with PrgressPaymentDocumentReadMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Flexible(
            flex: 8,
            child: Container(),
          ),
          Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButton(
                  context,
                  backgroundColor: ColorName.neutral0,
                  onTap: () =>
                      context.router.push(const ProfileRequestReportRoute()),
                  text: LocaleKeys.general_button_oppose,
                  borderColor: ColorName.redBase,
                  textColor: ColorName.redBase,
                ),
                buildButton(
                  context,
                  backgroundColor: ColorName.blueBase,
                  onTap: () {
                    showSuccessToast(
                      LocaleKeys.profile_progress_payment_success_toast.tr(),
                    );
                    // Fluttertoast.showToast(
                    //   msg: LocaleKeys.profile_progress_payment_success_toast
                    //       .tr(),
                    //   toastLength: Toast.LENGTH_SHORT,
                    //   gravity: ToastGravity.BOTTOM,
                    //   backgroundColor: ColorName.greenLight,
                    //   textColor: ColorName.neutral900,
                    //   fontSize: 16,
                    // );
                    context.router.push(const BottomNAvigationBarRoute());
                  },
                  text: LocaleKeys.general_button_approve,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: ColorName.neutral100,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      actions: [
        GestureDetector(
          onDoubleTap: () {},
          child: Padding(
            padding: const ProjectPadding.scaffold(),
            child: Assets.icons.icShareBoxFill.toGetSvg(),
          ),
        ),
      ],
    );
  }

  /// build elevation button
  Container buildButton(
    BuildContext context, {
    required Color backgroundColor,
    required GestureTapCallback onTap,
    required String text,
    Color borderColor = ColorName.blueBase,
    Color textColor = ColorName.neutral0,
  }) {
    return Container(
      height: 40.h,
      width: 161.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: ProjectBorderRadius.allCircleLarge(),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        onPressed: onTap,
        child: AutoSizeText(
          text.tr(),
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: textColor),
        ),
      ),
    );
  }
}
