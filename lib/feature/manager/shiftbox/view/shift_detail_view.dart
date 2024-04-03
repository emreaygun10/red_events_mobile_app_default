import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class ShiftDetailView extends StatelessWidget {
  const ShiftDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AutoSizeText('Shift Detayı'),
        backgroundColor: ColorName.neutral100,
      ),
      body: Padding(
        padding: const ProjectPadding.scaffold(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTopCard(context),
            buildBetweenText(
              context: context,
              text: LocaleKeys.manager_shift_detail_shift_content,
            ),
            buildCenterContentCard(context),
            buildBetweenText(
              context: context,
              text: LocaleKeys.manager_shift_detail_still_shift_info,
            ),
            biuldBottomContent(context),
            const Spacer(
              flex: 3,
            ),
            buildBottomButtons(
              leftButtonIcon: Assets.icons.icDeleteBin
                  .toGetSvgWithColor(color: ColorName.redBase),
              leftButtonText: 'Shift Sil',
              context: context,
              leftColor: ColorName.redBase,
              leftonTap: () {},
              rightButtonIcon: const Icon(
                Icons.edit,
                color: ColorName.neutral400,
              ),
              rightButtonText: 'Shift Düzenle',
              rightColor: ColorName.neutral400,
              rightonTap: () {},
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Row buildBottomButtons({
    required Widget leftButtonIcon,
    required String leftButtonText,
    required Widget rightButtonIcon,
    required String rightButtonText,
    required Color leftColor,
    required Color rightColor,
    required BuildContext context,
    required void Function() leftonTap,
    required void Function() rightonTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButton(
          leftonTap,
          leftColor,
          leftButtonIcon,
          leftButtonText,
          context,
        ),
        buildButton(
          rightonTap,
          rightColor,
          rightButtonIcon,
          rightButtonText,
          context,
        ),
      ],
    );
  }

  GestureDetector buildButton(
    void Function() onTap,
    Color color,
    Widget buttonIcon,
    String buttonText,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () => onTap,
      child: Container(
        height: 40.h,
        width: 150.w,
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 2),
          borderRadius: ProjectBorderRadius.allCircleLarge(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttonIcon,
            Padding(
              padding: const EdgeInsets.only(left: 4).r,
              child: AutoSizeText(
                buttonText,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container biuldBottomContent(BuildContext context) {
    return Container(
      padding: const ProjectPadding.allMedium(),
      decoration: BoxDecoration(
        color: ColorName.neutral0,
        borderRadius: ProjectBorderRadius.allCircleMedium(),
      ),
      child: buildCustomCardRow(
        padding: 0,
        leftSideText: LocaleKeys.manager_shift_detail_finished_time,
        context: context,
        rightSideWidget:
            buildRideSideText(text: '14.05.2024', context: context),
      ),
    );
  }

  Container buildCenterContentCard(BuildContext context) {
    return Container(
      height: 236.h,
      width: context.sized.width,
      padding: const ProjectPadding.allMedium(),
      decoration: const BoxDecoration(color: ColorName.neutral0),
      child: Column(
        children: [
          buildCustomCardRow(
            leftSideText: LocaleKeys.manager_shift_detail_date,
            context: context,
            rightSideWidget:
                buildRideSideText(text: '14.04.2024', context: context),
          ),
          buildCustomCardRow(
            leftSideText: LocaleKeys.manager_shift_detail_shift_hour,
            context: context,
            rightSideWidget: buildRideSideText(text: '07:00', context: context),
          ),
          buildCustomCardRow(
            leftSideText: LocaleKeys.manager_shift_detail_shift_type,
            context: context,
            rightSideWidget: Container(
              height: 20.h,
              width: 56.w,
              decoration: BoxDecoration(
                border: Border.all(color: ColorName.greenBase),
                borderRadius: ProjectBorderRadius.allCircleNormal(),
              ),
              child: AutoSizeText(
                'Sabit',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: ColorName.greenBase),
              ),
            ),
          ),
          buildCustomCardRow(
            leftSideText: LocaleKeys.manager_shift_detail_duty,
            context: context,
            rightSideWidget:
                buildRideSideText(text: 'Garson', context: context),
          ),
          buildCustomCardRow(
            leftSideText: LocaleKeys.manager_shift_detail_request,
            context: context,
            rightSideWidget: SizedBox(
              width: 100.w,
              height: 20.h,
              child: Row(
                children: [
                  const Expanded(
                    child: LinearProgressIndicator(
                      backgroundColor: ColorName.neutral200,
                      color: ColorName.redBase,
                      value: 0.4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4).r,
                    child: AutoSizeText(
                      '10/4',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: ColorName.neutral500,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          buildCustomCardRow(
            padding: 0,
            leftSideText: LocaleKeys.manager_shift_detail_shift_type,
            context: context,
            rightSideWidget: Container(
              height: 20.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: ColorName.orangeLight,
                borderRadius: ProjectBorderRadius.allCircleSmall(),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.icons.icTime
                      .toGetSvgWithColor(color: ColorName.orangeBase),
                  AutoSizeText(
                    '6',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorName.orangeBase),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AutoSizeText buildRideSideText({
    required String text,
    required BuildContext context,
  }) {
    return AutoSizeText(
      text,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: ColorName.neutral900,
          ),
    );
  }

  Padding buildCustomCardRow({
    required String leftSideText,
    required Widget rightSideWidget,
    required BuildContext context,
    double padding = 16,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildLeftSideText(text: leftSideText, context: context),
          rightSideWidget,
        ],
      ),
    );
  }

  AutoSizeText buildLeftSideText({
    required String text,
    required BuildContext context,
  }) {
    return AutoSizeText(
      text.tr(),
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: ColorName.neutral400,
          ),
    );
  }

  Container buildBetweenText({
    required BuildContext context,
    required String text,
  }) {
    return Container(
      height: 28.h,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16).r,
      child: AutoSizeText(
        text.tr(),
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: ColorName.neutral400),
      ),
    );
  }

  SizedBox buildTopCard(BuildContext context) {
    return SizedBox(
      height: 136.h,
      width: context.sized.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 104.h,
              width: context.sized.width,
              decoration: BoxDecoration(
                color: ColorName.neutral0,
                borderRadius: ProjectBorderRadius.allCircleMedium(),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AutoSizeText(
                    'Shift Bilgileri',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  AutoSizeText(
                    '08.01.2024 - 17:34',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorName.neutral500),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Opacity(
              opacity: 0.6,
              child: Container(
                padding: const ProjectPadding.allSmall(),
                height: 64.h,
                width: 64.w,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorName.greenBase, width: 2),
                  color: ColorName.greenLighter,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const ProjectPadding.allSmall(),
                  child: Assets.icons.icCalendar
                      .toGetSvgWithColor(color: ColorName.greenBase),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
