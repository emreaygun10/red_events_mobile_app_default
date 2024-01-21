import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_profile_header.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/empty_list_card.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/cubit/profile_progress_payment_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/mixin/profile_progress_paymnet_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/state/profile_progress_payment_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/education_chip_enum.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
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
                buildChipList(),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            BlocBuilder<ProfileProgressPaymentBloc,
                ProfileProgressPaymentState>(
              builder: (context, state) {
                return state.chipIndex == 0
                    ? buildSummarySalary()
                    : buildTitle();
              },
            ),
            BlocBuilder<ProfileProgressPaymentBloc,
                ProfileProgressPaymentState>(
              builder: (context, state) {
                return state.chipIndex == 0
                    ? buildMainPage(context)
                    : state.isEmptyBordro
                        ? Expanded(
                            child: Padding(
                              padding: const ProjectPadding.scaffold(),
                              child: ListView.builder(
                                itemCount: 3,
                                itemBuilder: (context, index) => Padding(
                                  padding:
                                      const ProjectPadding.symmetricNormalV(),
                                  child: Container(
                                    padding: const ProjectPadding.allMedium(),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: ColorName.neutral200,
                                      ),
                                      borderRadius:
                                          ProjectBorderRadius.allCircleNormal(),
                                    ),
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            Assets.icons.icPdfTemp.svg(
                                              package: ModuleEnum.gen.value,
                                              height: 40,
                                              width: 40,
                                            ),
                                            Padding(
                                              padding: const ProjectPadding
                                                  .symmetricSmallH(),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  AutoSizeText(
                                                    'Aralık 2023',
                                                    style:
                                                        textTheme.labelMedium,
                                                  ),
                                                  AutoSizeText(
                                                    '120 mb',
                                                    style: textTheme.labelSmall!
                                                        .copyWith(
                                                      color:
                                                          ColorName.neutral400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Assets.icons.icDownload.toGetSvg(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
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
                    border: Border.all(
                      color: ColorName.neutral200,
                      width: 2,
                    ),
                    borderRadius: ProjectBorderRadius.allCircleNormal().r,
                  ),
                  width: context.sized.width,
                  padding: const ProjectPadding.symmetricNormalH()
                      .copyWith(top: 20, bottom: 20)
                      .r,
                  child: Column(
                    children: [
                      buildSalarySum(),
                      buildSalaryDetailCard(),
                      Padding(
                        padding: const ProjectPadding.symmetricMediumV(),
                        child: buildSalaryDetailCard(),
                      ),
                      buildSalaryDetailCard(),
                      buildSumLine(
                        amount: '39.000',
                        amountColor: ColorName.neutral900,
                      ),
                      buildExpenseCard(),
                      buildSumLine(
                        amount: '7.000 TL',
                        amountColor: ColorName.redBase,
                      ),
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
      padding: const EdgeInsets.all(12).r,
      decoration: BoxDecoration(
        border: Border.all(color: ColorName.neutral200),
        borderRadius: ProjectBorderRadius.allCircleNormal().r,
      ),
      child: Column(
        children: [
          Row(
            children: [
              AutoSizeText(
                '12 Ekim',
                style: textTheme.bodySmall,
              ),
              Padding(
                padding: const ProjectPadding.symmetricSmallH(),
                child: AutoSizeText(
                  '07:00 - 17:00',
                  style: textTheme.bodySmall!.copyWith(
                    color: ColorName.neutral400,
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: ColorName.neutral200,
            height: 2,
          ),
          buildLineTexRed(
            label: LocaleKeys.profile_progress_payment_break_time,
            text: '-500 TL',
          ),
          buildLineTexRed(
            label: LocaleKeys.profile_progress_payment_performing,
            text: '-2.500 TL',
          ),
          buildLineTexRed(
            label: LocaleKeys.profile_progress_payment_advance_payment,
            text: '-7.500 TL',
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

  Container buildSalaryDetailCard() {
    return Container(
      padding: const EdgeInsets.all(12).r,
      decoration: BoxDecoration(
        border: Border.all(color: ColorName.neutral200),
        borderRadius: ProjectBorderRadius.allCircleNormal().r,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AutoSizeText(
                    '12 Ekim',
                    style: textTheme.bodySmall,
                  ),
                  Padding(
                    padding: const ProjectPadding.symmetricSmallH(),
                    child: AutoSizeText(
                      '07:00 - 17:00',
                      style: textTheme.bodySmall!.copyWith(
                        color: ColorName.neutral400,
                      ),
                    ),
                  ),
                ],
              ),
              Chip(
                shape: const StadiumBorder(),
                labelStyle: textTheme.labelSmall,
                backgroundColor: ColorName.greenLight,
                side: BorderSide.none,
                label: const AutoSizeText(
                  'Maaş',
                ),
              ),
            ],
          ),
          const Divider(
            color: ColorName.neutral200,
            height: 2,
          ),
          buildLineText(
            label: LocaleKeys.profile_progress_payment_departmant,
            text: 'Manzara Restaurant',
          ),
          buildLineText(
            label: LocaleKeys.profile_progress_payment_amount,
            text: '20.000,00',
          ),
          buildLineText(
            label: LocaleKeys.profile_progress_payment_working_hour,
            text: 'Manzara Restaurant',
          ),
          buildLineText(
            label: LocaleKeys.profile_progress_payment_overtime_amount,
            text: 'Manzara Restaurant',
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
        AutoSizeText(
          '${LocaleKeys.profile_progress_payment_working_hour.tr()}:',
          style: textTheme.labelSmall!.copyWith(color: ColorName.neutral400),
        ),
        SizedBox(
          height: 24.h,
        ),
      ],
    );
  }

  Padding buildLineText({required String label, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10).r,
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
      padding: const EdgeInsets.symmetric(vertical: 10).r,
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

  Expanded buildSummarySalary() {
    return Expanded(
      child: Padding(
        padding: const ProjectPadding.scaffold(),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Container(
              padding: const EdgeInsets.all(12).r,
              height: 64.h,
              decoration: BoxDecoration(
                color: ColorName.neutral0,
                border: Border.all(color: ColorName.neutral200, width: 2),
                borderRadius: ProjectBorderRadius.allCircleNormal().r,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildCustomAmount(
                    amount: '20.000',
                    type: LocaleKeys.profile_progress_payment_salary,
                  ),
                  const VerticalDivider(),
                  buildCustomAmount(
                    amount: '500',
                    type: LocaleKeys.profile_progress_payment_daily_salary,
                  ),
                  const VerticalDivider(),
                  buildCustomAmount(
                    amount: '80',
                    type: LocaleKeys.profile_progress_payment_working_hour,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildCustomAmount({required String amount, required String type}) {
    return Column(
      children: [
        AutoSizeText(
          '$amount ₺',
          style: textTheme.labelMedium,
        ),
        AutoSizeText(
          type.tr(),
          style: textTheme.labelSmall!.copyWith(color: ColorName.neutral400),
        ),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: ColorName.neutral0,
      leading: GestureDetector(
        onTap: () async {
          await context.router.pop();
        },
        child: Padding(
          padding: const ProjectPadding.allSmall(),
          child: SizedBox(
            height: 24.h,
            width: 24.w,
            child: Container(
              decoration: const BoxDecoration(
                color: ColorName.neutral200,
                shape: BoxShape.circle,
              ),
              child: Assets.icons.icArroeLeftS.toGetSvgWithColor(
                color: ColorName.neutral900,
              ),
            ),
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

  Padding buildChipList() {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: SizedBox(
        height: 56.h,
        child: BlocBuilder<ProfileProgressPaymentBloc,
            ProfileProgressPaymentState>(
          builder: (context, state) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ProgressPaymentChipEnum.values.length,
              itemBuilder: (BuildContext context, int index) {
                return buildChip(index, state);
              },
            );
          },
        ),
      ),
    );
  }

  Padding buildChip(int index, ProfileProgressPaymentState state) {
    return Padding(
      padding: const ProjectPadding.symmetricXSmallH(),
      child: GestureDetector(
        onTap: () {
          profileProgressPaymentBloc.changeChipIndex(index);
        },
        child: Chip(
          padding: const ProjectPadding.customChipPaddingLarge(),
          shape: const StadiumBorder(),
          side: BorderSide.none,
          backgroundColor: state.chipIndex == index
              ? ColorName.blueBase
              : ColorName.neutral200,
          label: AutoSizeText(
            ProgressPaymentChipEnum.values[index].value.tr(),
          ),
        ),
      ),
    );
  }
}
