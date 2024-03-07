import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

part 'widget/hr_appbar.dart';

@RoutePage()
class HrView extends StatefulWidget {
  const HrView({super.key});

  @override
  State<HrView> createState() => _HrViewState();
}

class _HrViewState extends BaseState<HrView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HrAppBarWidget(),
      body: Column(
        children: [
          buildFilterColumn(),
          buildSecondFilterRow(),
          Expanded(
            child: Padding(
              padding: const ProjectPadding.scaffold(),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return index == 0
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const ProjectPadding.symmetricNormalV(),
                              child: AutoSizeText(
                                'Tüm Personeller (936)',
                                style: textTheme.titleLarge!.copyWith(
                                  color: ColorName.neutral700,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            buildPersonelCard(context),
                          ],
                        )
                      : buildPersonelCard(context);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 5.h,
                  );
                },
                itemCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildPersonelCard(BuildContext context) {
    return Container(
      padding: const ProjectPadding.allMedium(),
      height: 76.h,
      width: context.sized.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorName.neutral200,
        ),
        borderRadius: ProjectBorderRadius.allCircleMedium(),
        color: ColorName.neutral0,
        boxShadow: const [
          BoxShadow(
            color: ColorName.neutral300,
            blurRadius: 4,
            offset: Offset(0, 2),
            blurStyle: BlurStyle.solid,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              buildCircleAvatar(
                url:
                    'https://gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50)',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      AutoSizeText(
                        'Başak Yılmaz Güven',
                        style: textTheme.titleMedium!.copyWith(
                          color: ColorName.neutral700,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const ProjectPadding.symmetricXSmallH(),
                        child: Container(
                          width: 24.w,
                          height: 16.h,
                          decoration: BoxDecoration(
                            color: ColorName.neutral200,
                            borderRadius: ProjectBorderRadius.allCircleNormal(),
                          ),
                          child: const Center(child: AutoSizeText('FT')),
                        ),
                      ),
                    ],
                  ),
                  Text.rich(
                    TextSpan(
                      style: textTheme.titleMedium!.copyWith(
                        color: ColorName.neutral500,
                        fontWeight: FontWeight.w500,
                      ),
                      children: const [
                        TextSpan(text: 'Food & Beverage'),
                        TextSpan(text: '-'),
                        TextSpan(text: 'Lobi Bar'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Assets.icons.icStarFill.toGetSvg(),
                  AutoSizeText(
                    '(4.5)',
                    style: textTheme.titleSmall!.copyWith(
                      color: ColorName.neutral700,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Assets.icons.icWhatsApp.toGetSvg(),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox buildCircleAvatar({
    required String url,
  }) {
    return SizedBox(
      height: 48.h,
      width: 48.w,
      child: Stack(
        children: [
          Align(
            child: SizedBox(
              height: 48.h,
              width: 48.w,
              child: Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    url,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 16.h,
              width: 27.w,
              decoration: BoxDecoration(
                borderRadius: ProjectBorderRadius.allCircleLarge(),
                color: ColorName.neutral100,
              ),
              child: const Center(child: AutoSizeText('24')),
            ),
          ),
        ],
      ),
    );
  }

  Container buildSecondFilterRow() {
    return Container(
      padding: const ProjectPadding.scaffold(),
      height: 52.h,
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: ColorName.neutral200,
          ),
        ),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) => Center(
          child: AutoSizeText(
            '800 Çalışan',
            style: textTheme.titleSmall!.copyWith(
              color: ColorName.neutral900,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 9.w,
        ),
      ),
    );
  }

  Container buildFilterColumn() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10).r,
      height: 52.h,
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: ColorName.neutral200,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildRowItem(
            widget: Assets.icons.icFilter.toGetSvg(),
            isVisibleDownArrow: false,
          ),
          buildRowItem(text: 'Departman'),
          buildRowItem(text: 'Bölüm'),
          buildRowItem(text: 'Görev'),
        ],
      ),
    );
  }

  Container buildRowItem({
    String text = '',
    Widget? widget,
    bool isVisibleDownArrow = true,
  }) {
    return Container(
      height: 32.h,
      padding: const ProjectPadding.allSmall(),
      decoration: BoxDecoration(
        borderRadius: ProjectBorderRadius.allCircleMedium(),
        color: ColorName.neutral200,
      ),
      child: Row(
        children: [
          widget ??
              AutoSizeText(
                text.tr(),
                style: textTheme.titleSmall,
              ),
          SizedBox(
            width: 8.w,
          ),
          Visibility(
            visible: isVisibleDownArrow,
            child: Assets.icons.icDownArrow.toGetSvg(),
          ),
        ],
      ),
    );
  }
}
