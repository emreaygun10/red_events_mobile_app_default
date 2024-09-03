import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/widgets/custom_occupancy_widget.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/bloc/base_bloc.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/manager_enum.dart';
import 'package:widgets/widgets.dart';

final class ShiftListView extends StatefulWidget {
  const ShiftListView({super.key});

  @override
  State<ShiftListView> createState() => _ShiftListViewState();
}

class _ShiftListViewState extends BaseState<ShiftListView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BaseBloc(),
      child: Padding(
        padding: const ProjectPadding.symmetricMediumV(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomOccupancyWidget(
              mainText: 'Mart Doluluk Oranı',
              occupancy: '90',
            ),
            buildShiftList(),
          ],
        ),
      ),
    );
  }

  Padding buildShiftList() {
    return Padding(
      padding: const ProjectPadding.symmetricMediumV(),
      child: Container(
        height: 470.h,
        padding: const ProjectPadding.allNormal().copyWith(top: 16, bottom: 16),
        decoration: BoxDecoration(
          color: ColorName.neutral0,
          borderRadius: ProjectBorderRadius.allCircleMedium(),
        ),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    ShiftBoxTopTitleEnum.list.value,
                    style: textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  buildAddShiftButton(),
                ],
              ),
              const Padding(
                padding: ProjectPadding.symmetricMediumV(),
                child: Divider(
                  color: ColorName.neutral200,
                ),
              ),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 12.h,
                ),
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 100,
                itemBuilder: (context, index) {
                  return buildListItem(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildListItem(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14).r,
      height: 78.h,
      width: context.sized.width,
      decoration: BoxDecoration(
        color: ColorName.neutral100,
        borderRadius: ProjectBorderRadius.allCircleMedium(),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 36.w,
            child: buildDateColumn(),
          ),
          const VerticalDivider(
            color: ColorName.neutral300,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildFirstRow(),
                AutoSizeText(
                  '07:00',
                  style: textTheme.titleSmall!.copyWith(
                    fontSize: 11.sp,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 32.w,
                      height: 6.h,
                      child: const LinearProgressIndicator(
                        backgroundColor: ColorName.neutral100,
                        color: ColorName.blueBase,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row buildFirstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            AutoSizeText(
              'Manzara Restaurant',
              style: textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 6.w,
            ),
            Container(
              padding: const EdgeInsets.all(2).r,
              height: 16.h,
              width: 16.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorName.greenDark,
              ),
              child: Assets.icons.icPushpinFill.toGetSvgWithColor(
                color: ColorName.neutral0,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => context.router.push(const ShiftDetailRoute()),
          child: Assets.icons.icMore.toGetSvg(),
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

  Container buildAddShiftButton() {
    return Container(
      height: 32.h,
      width: 104.w,
      decoration: BoxDecoration(
        color: ColorName.blueBase,
        borderRadius: ProjectBorderRadius.allCircleMedium(),
      ),
      padding: const EdgeInsets.all(6).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            Icons.add,
            color: ColorName.neutral0,
          ),
          AutoSizeText(
            'Shift Ekle',
            style: textTheme.titleMedium!.copyWith(
              color: ColorName.neutral0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
