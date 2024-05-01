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

@RoutePage()
final class WeaklyShiftDetailView extends StatefulWidget {
  const WeaklyShiftDetailView({super.key});

  @override
  State<WeaklyShiftDetailView> createState() => _WeaklyShiftDetailViewState();
}

class _WeaklyShiftDetailViewState extends BaseState<WeaklyShiftDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorName.neutral100,
        surfaceTintColor: Colors.transparent,
        title: AutoSizeText(
          LocaleKeys.manager_shift_detail_title.tr(),
          style: textTheme.titleLarge,
        ),
      ),
      body: buildMainWidget(context),
    );
  }

  SizedBox buildMainWidget(BuildContext context) {
    return SizedBox(
      height: context.sized.height,
      width: context.sized.width,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const ProjectPadding.scaffold()
                .copyWith(top: 32.h, bottom: 20.h),
            child: Container(
              decoration: BoxDecoration(
                color: ColorName.neutral0,
                borderRadius: ProjectBorderRadius.allCircleLarge(),
              ),
              height: context.sized.height,
              width: context.sized.width,
              child: Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AutoSizeText(
                        'Emre Aygün',
                        style: textTheme.headlineSmall!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      buildChipList(),
                      SizedBox(
                        height: 8.h,
                      ),
                      buildLinearProgress(),
                      Container(
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              buildListItem(context),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 12.h,
                          ),
                          itemCount: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 64.h,
            width: 64.w,
            child: const CircleAvatar(),
          ),
        ],
      ),
    );
  }

  Row buildLinearProgress() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 140.w,
          height: 8.h,
          child: const LinearProgressIndicator(
            backgroundColor: ColorName.neutral100,
            color: ColorName.orangeBase,
            value: 0.4,
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        AutoSizeText(
          '6/10',
          style: textTheme.titleSmall!.copyWith(
            color: ColorName.neutral500,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Row buildChipList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Chip(
          shape: const StadiumBorder(),
          label: Text(
            'FT',
            style: textTheme.titleMedium,
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Chip(
          shape: const StadiumBorder(),
          label: Text(
            'Garson',
            style: textTheme.titleMedium,
          ),
        ),
      ],
    );
  }

  Padding buildListItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).r,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16).r,
        decoration: BoxDecoration(
          color: ColorName.neutral100,
          border: Border.all(
            color: ColorName.neutral200,
          ),
          borderRadius: ProjectBorderRadius.allCircleMedium(),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 36.w,
              child: buildDateColumn(),
            ),
            const VerticalDivider(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildFirstRow(),
                  buildSecondtRow(),
                  buildThirdRow(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildThirdRow() {
    return Row(
      children: [
        buildCustomCircleWidget(
          Assets.icons.icMapPin.toGetSvg(),
        ),
        SizedBox(
          width: 8.w,
        ),
        const Text('Lobi Bar'),
        SizedBox(
          width: 8.w,
        ),
        buildCustomCircleWidget(
          const Center(child: Text('D')),
        ),
      ],
    );
  }

  Container buildCustomCircleWidget(Widget widget) {
    return Container(
      height: 16.h,
      width: 16.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ColorName.neutral200,
      ),
      child: widget,
    );
  }

  Row buildFirstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '07:00 - 15:00',
                style: textTheme.titleMedium!.copyWith(
                  color: ColorName.neutral900,
                ),
              ),
              TextSpan(
                text: ' / ',
                style: textTheme.titleSmall!.copyWith(
                  color: ColorName.neutral900,
                ),
              ),
              TextSpan(
                text: '06:51 -15:04',
                style: textTheme.titleSmall!.copyWith(
                  color: ColorName.neutral900,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 24.h,
          width: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorName.greenBase,
            ),
            color: ColorName.greenDark,
          ),
          child: Assets.icons.icCheckLine.toGetSvg(),
        ),
      ],
    );
  }

  Column buildDateColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          '20',
          style: textTheme.labelLarge!.copyWith(
            color: ColorName.neutral400,
            fontWeight: FontWeight.w500,
          ),
        ),
        AutoSizeText(
          'PZT',
          style: textTheme.titleSmall!.copyWith(
            color: ColorName.neutral400,
            fontSize: 11.sp,
          ),
        ),
      ],
    );
  }

  Row buildSecondtRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            AutoSizeText(
              'Manzara Restaurant',
              style: textTheme.titleSmall!.copyWith(),
            ),
          ],
        ),
      ],
    );
  }
}
