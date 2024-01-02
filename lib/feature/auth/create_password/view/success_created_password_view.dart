import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_circle_shape.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_top_linear_gradient.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class SuccessCreatedPasswordView extends StatelessWidget {
  const SuccessCreatedPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(),
      body: Column(
        children: [
          const BuildTopLinearGradient(),
          Center(
            child: Padding(
              padding: const ProjectPadding.scaffold(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomBuildCircleShape(),
                  SizedBox(
                    height: 16.h,
                  ),
                  buildTitle(
                    context,
                    LocaleKeys.create_password_success_title,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  buildDescription(
                    context,
                    LocaleKeys.create_password_success_desc,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  buildElevatedButton(
                    context,
                    LocaleKeys.general_button_login,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: Assets.icons.icLogoDark.svg(
        package: ModuleEnum.gen.value,
        height: 40.h,
        width: 40.w,
      ),
    );
  }

  SizedBox buildElevatedButton(BuildContext context, String text) {
    return SizedBox(
      height: 56.h,
      width: 200.w,
      child: ElevatedButton(
        onPressed: () {
          context.router.pushAndPopUntil(
            const LoginRoute(),
            scopedPopUntil: true,
            predicate: (Route<dynamic> route) => false,
          );
        },
        child: AutoSizeText(
          text.tr(),
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: ColorName.neutral0),
        ),
      ),
    );
  }

  AutoSizeText buildDescription(BuildContext context, String desc) {
    return AutoSizeText(
      desc.tr(),
      style: Theme.of(context).textTheme.bodyMedium,
      textAlign: TextAlign.center,
    );
  }

  SizedBox buildTitle(BuildContext context, String title) {
    return SizedBox(
      height: 64.h,
      child: AutoSizeText(
        title.tr(),
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: ColorName.neutral900,
              fontWeight: FontWeight.bold,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
