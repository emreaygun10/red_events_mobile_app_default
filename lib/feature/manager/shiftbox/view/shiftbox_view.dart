import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/mixin/shiftbox_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/widgets/custom_empty_list.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/bloc/shiftbox_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/state/shiftbox_state.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/manager_enum.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/shift_enum.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_divider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:widgets/widgets.dart';

part 'widgets/custom_app_bar.dart';

class ShiftBoxView extends StatefulWidget {
  const ShiftBoxView({super.key});

  @override
  State<ShiftBoxView> createState() => _ShiftBoxViewState();
}

class _ShiftBoxViewState extends BaseState<ShiftBoxView> with ShiftboxMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => shiftBoxBloc,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTopCard(context),
          Expanded(child: buildBottomCard(context)),
          SizedBox(
            height: 24.h,
          ),
        ],
      ),
    );
  }

  Container buildBottomCard(BuildContext context) {
    return Container(
      padding: const ProjectPadding.scaffold().copyWith(top: 16, bottom: 16).r,
      height: 435.h,
      width: context.sized.width,
      decoration: BoxDecoration(
        borderRadius: ProjectBorderRadius.allCircleNormal(),
        color: ColorName.neutral0,
      ),
      child: Column(
        children: [
          buildTitleRow(context),
          buildDateRow(),
          buildFilterRow(context),
          Expanded(
            child: CustomEmptyList(textTheme: textTheme),
          ),
        ],
      ),
    );
  }

  Padding buildFilterRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12).r,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 36,
              width: context.sized.width,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Ara',
                  hintStyle: textTheme.titleLarge!.copyWith(
                    color: ColorName.neutral500,
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 10).r,
                  prefixIcon: Padding(
                    padding: const ProjectPadding.allXSmall().r,
                    child: Assets.icons.icSearch.toGetSvg(),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorName.neutral900,
                    ),
                    borderRadius: ProjectBorderRadius.allCircleNormal(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8).r,
            child: Container(
              height: 32.h,
              width: 32.w,
              padding: const ProjectPadding.allXSmall(),
              decoration: BoxDecoration(
                color: ColorName.neutral200,
                borderRadius: ProjectBorderRadius.allCircleMedium(),
              ),
              child: Assets.icons.icFilter.toGetSvgWithColor(
                color: ColorName.neutral400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildTitleRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          ShiftBoxTopTitleEnum.list.value,
          style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
        ),
        TextButton(
          onPressed: () {
            context.router.push(AddShiftRoute());
          },
          child: AutoSizeText(
            'Shift Ekle',
            style: textTheme.titleMedium!.copyWith(
              color: ColorName.neutral500,
            ),
          ),
        ),
      ],
    );
  }

  Padding buildTopCard(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.symmetricNormalV(),
      child: Container(
        padding: const ProjectPadding.allMedium(),
        height: 144.h,
        width: context.sized.width,
        decoration: BoxDecoration(
          borderRadius: ProjectBorderRadius.allCircleNormal(),
          color: ColorName.neutral0,
        ),
        child: Column(
          children: [
            Padding(
              padding: const ProjectPadding.symmetricSmallV(),
              child: Row(
                children: [
                  Assets.icons.icCalendarEventLine
                      .toGetSvgWithColor(color: ColorName.blueBase),
                  Padding(
                    padding: const ProjectPadding.symmetricSmallH(),
                    child: AutoSizeText(
                      ShiftBoxTopTitleEnum.list.value,
                      style: textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: ColorName.neutral300,
              height: 2,
            ),
            Padding(
              padding: const ProjectPadding.symmetricMediumV(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 115.w,
                    height: 50.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText(
                              'Mart',
                              style: textTheme.titleMedium,
                            ),
                            AutoSizeText(
                              '0/0',
                              style: textTheme.titleMedium!.copyWith(
                                color: ColorName.neutral500,
                              ),
                            ),
                          ],
                        ),
                        const LinearProgressIndicator(
                          backgroundColor: ColorName.neutral200,
                          color: ColorName.redBase,
                          value: 0.4,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 2,
                    height: 50.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorName.neutral200),
                    ),
                  ),
                  SizedBox(
                    width: 115.w,
                    height: 50.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AutoSizeText(
                          'Toplam Çalışan',
                          style: textTheme.titleMedium!.copyWith(
                            color: ColorName.neutral500,
                            fontSize: 11.sp,
                          ),
                        ),
                        AutoSizeText(
                          'Çalışan Yok',
                          style: textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildDateRow() {
    return Padding(
      padding: const ProjectPadding.symmetricMediumV().copyWith(bottom: 12).r,
      child: Container(
        padding: const ProjectPadding.allSmall(),
        decoration: BoxDecoration(
          color: ColorName.neutral100,
          borderRadius: ProjectBorderRadius.allCircleMedium().r,
        ),
        child: BlocBuilder<ShiftBoxBloc, ShiftBoxState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: subtractDate,
                  child: Assets.icons.icArroeLeftS.toGetSvg(),
                ),
                GestureDetector(
                  onTap: () {
                    buildShowModalBottomSheetDate(context);
                  },
                  child: Row(
                    children: [
                      Assets.icons.icCalendar.toGetSvg(),
                      BlocConsumer<ShiftBoxBloc, ShiftBoxState>(
                        listener: (context, state) {
                          fixDateFormat(state.selectedMonth);
                        },
                        builder: (context, state) {
                          return AutoSizeText(selectedDateString);
                        },
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: addDate,
                  child: Assets.icons.icArrowRightS.toGetSvg(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> buildShowModalBottomSheetDate(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 350.h,
          decoration: const BoxDecoration(
            color: ColorName.neutral0,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const ProjectPadding.allMedium().r,
            child: Column(
              children: [
                const Padding(
                  padding: ProjectPadding.symmetricSmallV(),
                  child: CustomDivider(),
                ),
                SfDateRangePicker(
                  controller: datePickerController,
                  showNavigationArrow: true,
                  headerStyle: DateRangePickerHeaderStyle(
                    textStyle: textTheme.headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  view: DateRangePickerView.year,
                  onViewChanged: (DateRangePickerViewChangedArgs args) {
                    if (args.view.index < 1 || args.view.index > 2) {
                      changeDate(args.visibleDateRange.startDate!);
                      context.router.pop();
                      datePickerController.view = DateRangePickerView.year;
                    }
                  },
                  yearCellStyle: const DateRangePickerYearCellStyle(
                    todayCellDecoration:
                        BoxDecoration(color: ColorName.neutral0),
                    todayTextStyle: TextStyle(color: ColorName.neutral700),
                  ),
                  minDate: minDate,
                  initialSelectedDate: selectedDate,
                  maxDate: maxDate,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
