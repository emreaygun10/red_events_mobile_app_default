import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_container_chip.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_payroll_list_item.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_profile_header.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/empty_list_card.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/cubit/profile_progress_payment_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/mixin/profile_progress_paymnet_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/state/profile_progress_payment_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_divider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class ProfileProgressPaymentView extends StatefulWidget {
  const ProfileProgressPaymentView({super.key});

  @override
  State<ProfileProgressPaymentView> createState() =>
      _ProfileProgressPaymentViewState();
}

class _ProfileProgressPaymentViewState
    extends BaseState<ProfileProgressPaymentView>
    with ProfileProgressPaymentMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      // bottomNavigationBar: buildBottomNavigation(),
      body: BlocProvider(
        create: (context) => profileProgressPaymentBloc,
        child: Column(
          children: [
            CustomProfileHeader(
              columnList: [
                const SizedBox(
                  height: 16,
                ),
                buildTitleText(),
                buildChipList(profileProgressPaymentBloc),
              ],
            ),
            BlocBuilder<ProfileProgressPaymentBloc,
                ProfileProgressPaymentState>(
              builder: (context, state) {
                if (state.chipIndex) {
                  return buildDateRow();
                }
                return const SizedBox();
              },
            ),
            BlocBuilder<ProfileProgressPaymentBloc,
                ProfileProgressPaymentState>(
              builder: (context, state) {
                return state.chipIndex ? const SizedBox() : buildTitle();
              },
            ),
            BlocBuilder<ProfileProgressPaymentBloc,
                ProfileProgressPaymentState>(
              builder: (context, state) {
                return state.chipIndex
                    ? buildMainPage(context)
                    : state.isEmptyBordro
                        ? buildPayrollPage()
                        : EmptyListWarning(
                            icon: Assets.icons.icProgressPaymentEmptyList
                                .toGetSvg(),
                            textTheme: textTheme,
                            chipText: LocaleKeys
                                .profile_progress_payment_empty_list
                                .tr(),
                          );
              },
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildPayrollPage() {
    return Expanded(
      child: Padding(
        padding: const ProjectPadding.scaffold(),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) => Padding(
            padding: const ProjectPadding.symmetricNormalV(),
            child: CustomPayrollListItem(
              textTheme: textTheme,
              text: 'Aralık 2023',
              subText: '120 Mb',
              isOk: index == 0 ? true : false,
            ),
          ),
        ),
      ),
    );
  }

  Padding buildDateRow() {
    return Padding(
      padding: const ProjectPadding.scaffold().copyWith(top: 24, bottom: 12).r,
      child: Container(
        padding: const ProjectPadding.allSmall(),
        decoration: BoxDecoration(
          color: ColorName.neutral0,
          borderRadius: ProjectBorderRadius.allCircleMedium().r,
        ),
        child: BlocBuilder<ProfileProgressPaymentBloc,
            ProfileProgressPaymentState>(
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
                      BlocConsumer<ProfileProgressPaymentBloc,
                          ProfileProgressPaymentState>(
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

  Padding buildTitle() {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: Row(
        children: [
          AutoSizeText(
            LocaleKeys.profile_progress_payment_reports.tr(),
            style: textTheme.labelSmall!.copyWith(color: ColorName.neutral400),
          ),
        ],
      ),
    );
  }

  Expanded buildMainPage(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const ProjectPadding.scaffold(),
        child: ListView(
          children: [
            Wrap(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorName.neutral0,
                    borderRadius: ProjectBorderRadius.allCircleMedium().r,
                  ),
                  width: context.sized.width,
                  padding: const ProjectPadding.symmetricNormalH()
                      .copyWith(top: 20, bottom: 20)
                      .r,
                  child: Column(
                    children: [
                      buildSalarySum(),
                      buildSalaryDetailCard(),
                      // Padding(
                      //   padding: const ProjectPadding.symmetricMediumV(),
                      //   child: buildSalaryDetailCard(),
                      // ),
                      // buildSalaryDetailCard(),
                      // buildSumLine(
                      //   amount: '39.000',
                      //   amountColor: ColorName.neutral900,
                      // ),
                      Padding(
                        padding: const ProjectPadding.symmetricMediumV(),
                        child: buildExpenseCard(),
                      ),
                      // buildSumLine(
                      //   amount: '7.000 TL',
                      //   amountColor: ColorName.redBase,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildExpenseCard() {
    return Container(
      // padding: const EdgeInsets.all(12).r,
      decoration: BoxDecoration(
        border: Border.all(color: ColorName.neutral200),
        borderRadius: ProjectBorderRadius.allCircleNormal().r,
      ),
      child: Column(
        children: [
          // Row(
          //   children: [
          //     AutoSizeText(
          //       '12 Ekim',
          //       style: textTheme.bodySmall,
          //     ),
          //     Padding(
          //       padding: const ProjectPadding.symmetricSmallH(),
          //       child: AutoSizeText(
          //         '07:00 - 17:00',
          //         style: textTheme.bodySmall!.copyWith(
          //           color: ColorName.neutral400,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          buildSumLineText(leftText: 'Net Maaş', rightText: '', showIcon: true),
          const Divider(
            color: ColorName.neutral200,
            height: 2,
          ),
          buildLineTexRed(
            label: LocaleKeys.profile_progress_payment_sum__expense_progress,
            text: '-500 TL',
          ),
          buildLineTexRed(
            label: LocaleKeys.profile_progress_payment_sum_expense_food,
            text: '-2.500 TL',
          ),
          buildLineTexRed(
            label: LocaleKeys.profile_progress_payment_break_time,
            text: '-7.500 TL',
          ),
          buildLineTexRed(
            label: LocaleKeys.profile_progress_payment_sum_avans,
            text: '-7.500 TL',
          ),
          const Divider(
            color: ColorName.neutral200,
            height: 2,
          ),
          buildColorSumLineText(
            leftString: LocaleKeys.profile_progress_payment_sum_progress,
            rightText: '-4.000 TL',
            textColor: ColorName.redBase,
          ),
        ],
      ),
    );
  }

  Padding buildSumLine({
    required String amount,
    required Color amountColor,
  }) {
    return Padding(
      padding: const ProjectPadding.symmetricLargeV().copyWith(top: 12).r,
      child: Container(
        padding: const ProjectPadding.symmetricMediumH()
            .copyWith(top: 8, bottom: 8)
            .r,
        decoration: BoxDecoration(
          borderRadius: ProjectBorderRadius.allCircleSmall().r,
          color: ColorName.neutral100,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              LocaleKeys.profile_progress_payment_sum.tr(),
              style: textTheme.labelLarge!.copyWith(),
            ),
            AutoSizeText(
              amount.tr(),
              style: textTheme.labelLarge!.copyWith(color: amountColor),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildSalaryDetailCard() {
    return GestureDetector(
      onTap: () => context.router.push(
        ProgressPaymentDetailRoute(
          appBarTitle: LocaleKeys.profile_progress_payment_daily_detail,
        ),
      ),
      child: Container(
        // padding: const EdgeInsets.all(12).r,
        decoration: BoxDecoration(
          border: Border.all(color: ColorName.neutral200),
          borderRadius: ProjectBorderRadius.allCircleNormal().r,
        ),
        child: Column(
          children: [
            buildSumLineText(
              leftText: 'Günlük Hakediş',
              rightText: '29.000,00 TL',
              showIcon: true,
            ),
            const Divider(
              color: ColorName.neutral200,
              height: 2,
            ),
            buildLineText(
              label: LocaleKeys.profile_progress_payment_sum_progress,
              text: '20.000,00',
            ),
            buildLineText(
              label: LocaleKeys.profile_progress_payment_sum_day,
              text: '4 gün',
            ),
            buildLineText(
              label: LocaleKeys.profile_progress_payment_sum_work_hour,
              text: '1 saat',
            ),
            buildLineText(
              label: LocaleKeys.profile_progress_payment_sum_work_amount,
              text: '1.000,00',
            ),
            const Divider(
              color: ColorName.neutral200,
              height: 2,
            ),
            buildColorSumLineText(
              leftString: LocaleKeys.profile_progress_payment_sum_progress,
              rightText: '29.000,00 TL',
            ),
          ],
        ),
      ),
    );
  }

  Container buildColorSumLineText({
    required String leftString,
    required String rightText,
    Color? textColor,
  }) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorName.neutral200,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: buildSumLineText(
        leftText: leftString,
        rightText: rightText,
        textColor: textColor,
      ),
    );
  }

  Padding buildSumLineText({
    required String leftText,
    required String rightText,
    bool showIcon = false,
    Color? textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            leftText.tr(),
            style: textTheme.titleMedium!.copyWith(
              color: ColorName.neutral700,
              fontWeight: FontWeight.w900,
            ),
          ),
          Row(
            children: [
              AutoSizeText(
                rightText,
                style: textTheme.titleMedium!.copyWith(
                  color: textColor ?? ColorName.neutral700,
                  fontWeight: FontWeight.w900,
                ),
              ),
              if (showIcon)
                Padding(
                  padding: const ProjectPadding.symmetricXSmallH(),
                  child: Assets.icons.icEye
                      .toGetSvgWithColor(color: ColorName.blueBase),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Column buildSalarySum() {
    return Column(
      children: [
        AutoSizeText(
          LocaleKeys.profile_progress_payment_sum.tr(),
          style: textTheme.labelSmall!.copyWith(color: ColorName.neutral400),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: AutoSizeText(
            '32.000 TL',
            style: textTheme.headlineLarge,
          ),
        ),
        const Padding(
          padding: ProjectPadding.symmetricSmallV(),
          child: Divider(
            color: ColorName.neutral200,
            height: 2,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildSumColumn(
              title: LocaleKeys.profile_progress_payment_sum_progress,
              amount: '4.000 TL',
            ),
            buildSumColumn(
              title: LocaleKeys.profile_progress_payment_sum_missing_progress,
              amount: '4.000 TL',
            ),
          ],
        ),
        SizedBox(
          height: 24.h,
        ),
      ],
    );
  }

  Column buildSumColumn({required String amount, required String title}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AutoSizeText(
          title.tr(),
          style: textTheme.labelSmall!.copyWith(color: ColorName.neutral400),
        ),
        AutoSizeText(
          amount,
          style: textTheme.labelMedium,
        ),
      ],
    );
  }

  Padding buildLineText({required String label, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            label.tr(),
            style: textTheme.labelSmall!.copyWith(
              color: ColorName.neutral400,
            ),
          ),
          AutoSizeText(
            text,
            style: textTheme.labelSmall!.copyWith(
              color: ColorName.neutral900,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Padding buildLineTexRed({required String label, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            label.tr(),
            style: textTheme.labelSmall!.copyWith(
              color: ColorName.neutral400,
            ),
          ),
          AutoSizeText(
            text,
            style: textTheme.labelSmall!.copyWith(
              color: ColorName.redBase,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: ColorName.neutral0,
      leadingWidth: 80.w,
      leading: Padding(
        padding: const ProjectPadding.scaffold(),
        child: GestureDetector(
          onTap: () => context.router.pop(),
          child: Container(
            height: 24.h,
            width: 24.w,
            padding: const ProjectPadding.allSmall(),
            decoration: const BoxDecoration(
              color: ColorName.neutral200,
              shape: BoxShape.circle,
            ),
            child: Assets.icons.icArroeLeftS.toGetSvg(),
          ),
        ),
      ),
    );
  }

  Padding buildTitleText() {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: AutoSizeText(
        LocaleKeys.profile_list_progress_payment.tr(),
        style: textTheme.headlineMedium!.copyWith(
          color: ColorName.neutral900,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding buildChipList(ProfileProgressPaymentBloc profileProgressPaymentBloc) {
    return Padding(
      padding: const ProjectPadding.scaffold().copyWith(top: 12, bottom: 12).r,
      child:
          BlocBuilder<ProfileProgressPaymentBloc, ProfileProgressPaymentState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomContainerChip(
                textTheme: textTheme,
                chipIndex: state.chipIndex,
                text: LocaleKeys.profile_progress_payment_chips_payment,
                onTap: profileProgressPaymentBloc.changeChipIndex,
              ),
              CustomContainerChip(
                textTheme: textTheme,
                chipIndex: !state.chipIndex,
                text: LocaleKeys.profile_progress_payment_chips_payroll,
                onTap: profileProgressPaymentBloc.changeChipIndex,
              ),
            ],
          );
        },
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
