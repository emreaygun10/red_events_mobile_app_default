import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_top_linear_gradient.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class SuccessSignInView extends StatelessWidget {
  const SuccessSignInView({super.key});

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
                  buildCircleShape(),
                  SizedBox(
                    height: 16.h,
                  ),
                  buildTitle(context),
                  SizedBox(
                    height: 4.h,
                  ),
                  buildDescription(context),
                  SizedBox(
                    height: 40.h,
                  ),
                  buildElevatedButton(context),
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

  SizedBox buildElevatedButton(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: 200.w,
      child: ElevatedButton(
        onPressed: () {},
        child: AutoSizeText(
          LocaleKeys.general_button_quick_start.tr(),
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: ColorName.neutral0),
        ),
      ),
    );
  }

  AutoSizeText buildDescription(BuildContext context) {
    return AutoSizeText(
      LocaleKeys.sign_created_success_desc.tr(),
      style: Theme.of(context).textTheme.bodyMedium,
      textAlign: TextAlign.center,
    );
  }

  SizedBox buildTitle(BuildContext context) {
    return SizedBox(
      height: 64.h,
      child: AutoSizeText(
        LocaleKeys.sign_created_success.tr(),
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: ColorName.neutral900,
              fontWeight: FontWeight.bold,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Stack buildCircleShape() {
    return Stack(
      children: [
        Center(
          child: Container(
            width: 88.h,
            height: 88.w,
            decoration: BoxDecoration(
              color: ColorName.neutral100.withOpacity(0.8),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const ProjectPadding.allMedium(),
              child: Container(
                width: 56.h,
                height: 56.w,
                decoration: const BoxDecoration(
                  color: ColorName.greenBase,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const ProjectPadding.allMedium(),
                  child: Assets.icons.icCheckLine
                      .svg(package: ModuleEnum.gen.value),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
