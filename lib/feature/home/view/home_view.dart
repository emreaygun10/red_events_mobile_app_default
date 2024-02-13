import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/home/wiew_model/home_view_model.dart';
import 'package:red_events_mobile_app_defult/feature/home/wiew_model/mixin/home_view_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/home/wiew_model/state/home_view_state.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_sheets_bottom_sheet.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

part 'widget/home_app_bar.dart';

@RoutePage()

/// Home View
class HomeView extends StatefulWidget {
  // ignore: public_member_api_docs
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _HomeAppBar(),
      extendBodyBehindAppBar: true,
      body: BlocProvider(
        create: (context) => homeViewModel,
        child: Column(
          children: [
            buildTopCard(context),
            buildListDays(),
          ],
        ),
      ),
    );
  }

  Padding buildListDays() {
    return Padding(
      padding: const ProjectPadding.allNormal().r,
      child: Container(
        padding:
            const ProjectPadding.allNormal().copyWith(left: 16, right: 16).r,
        height: 350,
        decoration: BoxDecoration(
          color: ColorName.neutral0,
          borderRadius: ProjectBorderRadius.allCircleNormal().r,
        ),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 7,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10).r,
              child: BlocBuilder<HomeViewModel, HomeState>(
                builder: (context, state) {
                  return Container(
                    height: 72.h,
                    padding: const ProjectPadding.allMedium()
                        .copyWith(right: 14, left: 14)
                        .r,
                    decoration: BoxDecoration(
                      color: state.activeDayIndex == index
                          ? ColorName.blueLighter
                          : ColorName.neutral100,
                      borderRadius: ProjectBorderRadius.allCircleNormal().r,
                      border: state.activeDayIndex == index
                          ? Border.all(color: ColorName.blueBase)
                          : null,
                    ),
                    child: buildListTileContents(
                      isActive: state.activeDayIndex == index,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Row buildListTileContents({required bool isActive}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              buildPrefixDate(date: '30', day: 'CUM'),
              const VerticalDivider(
                width: 2,
                color: ColorName.neutral300,
              ),
              buildPostfixContents(
                clock: '07:00 - 15:00',
                place: 'Manzara Restaurant',
              ),
            ],
          ),
          if (isActive)
            Container(
              height: 36.h,
              width: 36.w,
              padding: const ProjectPadding.allSmall(),
              decoration: const BoxDecoration(
                color: ColorName.neutral900,
                shape: BoxShape.circle,
              ),
              child: Assets.icons.icQrCode.toGetSvg(),
            ),
        ],
      );

  Padding buildPostfixContents({
    required String clock,
    required String place,
  }) {
    return Padding(
      padding: const ProjectPadding.symmetricSmallH(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            clock,
            style: textTheme.titleMedium!.copyWith(
              color: ColorName.neutral800,
            ),
          ),
          AutoSizeText(
            place,
            style: textTheme.titleSmall!.copyWith(
              color: ColorName.neutral400,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildPrefixDate({required String date, required String day}) {
    return SizedBox(
      height: 40.h,
      width: 40.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            date,
            style: textTheme.bodyLarge!.copyWith(color: ColorName.neutral400),
          ),
          Expanded(
            child: AutoSizeText(
              day,
              style: textTheme.titleSmall!.copyWith(
                fontSize: 11,
                color: ColorName.neutral400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildTopCard(BuildContext context) {
    return Container(
      height: 324.h,
      width: context.sized.width,
      decoration: buildLinearGradient(),
      child: Padding(
        padding: const ProjectPadding.scaffold(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding:
                  const ProjectPadding.symmetricMediumH().copyWith(top: 8).r,
              decoration: BoxDecoration(
                color: ColorName.neutral0,
                borderRadius: ProjectBorderRadius.allCircleNormal().r,
              ),
              height: 180.h,
              width: context.sized.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    '29 Ocak - 04 Şubat',
                    style: textTheme.headlineMedium!
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  AutoSizeText(
                    'arası shift listesi',
                    style: textTheme.titleSmall!
                        .copyWith(color: ColorName.neutral400),
                  ),
                  buildChip(),
                  SizedBox(
                    height: 28.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildChangeButton(),
                      buildAcceptButton(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration buildLinearGradient() {
    return const BoxDecoration(
      color: Colors.white,
      gradient: LinearGradient(
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
        colors: [
          ColorName.blueBase,
          ColorName.neutral100,
        ],
        stops: [
          0.0,
          0.95,
        ],
      ),
    );
  }

  GestureDetector buildAcceptButton() {
    return GestureDetector(
      onTap: () async => buildShowBottomSheetRequest(context),
      child: Container(
        height: 40.h,
        width: 143.w,
        decoration: BoxDecoration(
          color: ColorName.greenBase,
          borderRadius: ProjectBorderRadius.allCircleMedium().r,
          border: Border.all(color: ColorName.neutral300),
        ),
        child: Center(
          child: AutoSizeText(
            LocaleKeys.general_button_approve.tr(),
            style: textTheme.titleMedium!.copyWith(color: ColorName.neutral0),
          ),
        ),
      ),
    );
  }

  GestureDetector buildChangeButton() {
    return GestureDetector(
      child: Container(
        height: 40.h,
        width: 143.w,
        decoration: BoxDecoration(
          borderRadius: ProjectBorderRadius.allCircleMedium().r,
          border: Border.all(color: ColorName.neutral300),
        ),
        child: Center(
          child: AutoSizeText(
            'Değişiklik telep et',
            style: textTheme.titleMedium,
          ),
        ),
      ),
    );
  }

  Padding buildChip() {
    return Padding(
      padding: const EdgeInsets.only(top: 8).r,
      child: Container(
        padding: const ProjectPadding.symmetricSmallH().r,
        decoration: BoxDecoration(
          borderRadius: ProjectBorderRadius.allCircleLarge().r,
          color: ColorName.orangeLight,
        ),
        height: 20.h,
        child: const AutoSizeText(
          'Onay Bekleniyor',
        ),
      ),
    );
  }

  Future<Widget?> buildShowBottomSheetRequest(BuildContext context) {
    return showModalBottomSheet<Widget>(
      isScrollControlled: true,
      context: context,
      showDragHandle: true,
      builder: (BuildContext context) {
        return const CustomSheetsBottomSheet();
      },
    );
  }
}
