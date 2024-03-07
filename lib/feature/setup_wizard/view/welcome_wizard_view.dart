import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/welcome_setup_enum.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_top_linear_gradient.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class WelcomeWizardSetupView extends StatelessWidget {
  const WelcomeWizardSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    const iconColor = ColorName.neutral400;
    const selectedColor = ColorName.neutral700;
    final listIcon = <Widget>[
      Assets.icons.icSecurePaymentLine.toGetSvgWithColor(color: iconColor),
      Assets.icons.icBuildingLine.toGetSvgWithColor(
        color: iconColor,
      ),
      Assets.icons.icFolderOpenLine.toGetSvgWithColor(color: iconColor),
      Assets.icons.icNotification05Line.toGetSvgWithColor(color: iconColor),
      Assets.icons.icUserLine.toGetSvgWithColor(color: iconColor),
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(),
      body: Column(
        children: [
          buildTopStack(context),
          buildFlexibleListView(listIcon),
          buildFlexibleButton(context),
        ],
      ),
    );
  }

  Flexible buildFlexibleButton(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20).r,
            child: SizedBox(
              height: 56.h,
              width: context.sized.width,
              child: ElevatedButton(
                onPressed: () {
                  context.router.pushAndPopUntil(
                    const PackageSelectionRoute(),
                    predicate: (route) => false,
                  );
                },
                child: AutoSizeText(
                  LocaleKeys.setup_button.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: ColorName.neutral0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Flexible buildFlexibleListView(List<Widget> listIcon) {
    return Flexible(
      flex: 5,
      child: Padding(
        padding: const ProjectPadding.scaffold(),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 24.h),
          itemCount: WelcomeSetupListEnum.values.length,
          itemBuilder: (context, index) => Container(
            padding: const ProjectPadding.scaffold(),
            height: 64.h,
            decoration: BoxDecoration(
              borderRadius: ProjectBorderRadius.allCircleMedium(),
              color: ColorName.neutral200,
            ),
            child: buildListTileContents(listIcon, index, context),
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 8.h,
          ),
        ),
      ),
    );
  }

  Row buildListTileContents(
    List<Widget> listIcon,
    int index,
    BuildContext context,
  ) {
    return Row(
      children: [
        Row(
          children: [
            Container(
              height: 36.h,
              width: 36.w,
              padding: const EdgeInsets.all(6).r,
              decoration: const BoxDecoration(
                color: ColorName.neutral300,
                shape: BoxShape.circle,
              ),
              child: listIcon[index],
            ),
            SizedBox(
              width: 9.w,
            ),
            AutoSizeText(
              WelcomeSetupListEnum.values[index].value.tr(),
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ],
    );
  }

  SizedBox buildTopStack(BuildContext context) {
    return SizedBox(
      height: 290.h,
      child: Stack(
        children: [
          const BuildTopLinearGradient(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const ProjectPadding.scaffold(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 88,
                    width: 88,
                    padding: const ProjectPadding.allMedium(),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorName.neutral200.withOpacity(0.3),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(14).r,
                      decoration: const BoxDecoration(
                        color: ColorName.success,
                        shape: BoxShape.circle,
                      ),
                      child: Assets.icons.icBuilding
                          .toGetSvgWithColor(color: ColorName.neutral0),
                    ),
                  ),
                  Padding(
                    padding: const ProjectPadding.symmetricNormalV()
                        .copyWith(bottom: 4)
                        .r,
                    child: AutoSizeText(
                      LocaleKeys.setup_title.tr(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Container(
                    padding: const ProjectPadding.symmetricNormalH(),
                    child: AutoSizeText(
                      LocaleKeys.setup_subTitle.tr(),
                      style: Theme.of(context).textTheme.labelSmall,
                      textAlign: TextAlign.center,
                    ),
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
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Container(
        height: 40.h,
        width: 40.w,
        padding: const ProjectPadding.allXSmall(),
        child: Assets.icons.icLogoDark.toGetSvg(),
      ),
    );
  }
}
