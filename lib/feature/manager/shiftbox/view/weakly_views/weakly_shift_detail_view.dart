import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/widgets/custom_personnel_day_container_add_shift.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/shift_enum.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_delete_model_bottom_sheet.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_success_model_bottom_sheet_content.dart';
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
                      CustomPersonelDayContainerWithAddShift(
                        textTheme: textTheme,
                        weaklyShiftType: WeaklyShiftType.off,
                      ),
                      CustomPersonelDayContainerWithAddShift(
                        textTheme: textTheme,
                        weaklyShiftType: WeaklyShiftType.empty,
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
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (ctx) async {
                final value = await buildDeleteShowModelBottomSheet(ctx);
                if (value ?? false) {
                  print('Silindi');

                  /// TODO : Shift Silme
                  if (context.mounted) {
                    await buildSuccessOperationModelBottomSheet(context);
                  }
                }
              },
              backgroundColor: ColorName.redBase,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Sil',
            ),
            SlidableAction(
              onPressed: (context) {
                context.router.push(
                  ShiftPermissionRoute(
                    fromTheView: FromTheView.personelDetail,
                  ),
                );
              },
              backgroundColor: ColorName.orangeBase,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Düzenle',
              padding: const ProjectPadding.allSmall().r,
            ),
          ],
        ),
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
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildFirstRow(),
                    buildSecondtRow(),
                    buildThirdRow(),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
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
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      padding: const EdgeInsets.all(2).r,
                      height: 20.h,
                      decoration: ShapeDecoration(
                        color: JobStatus.late.color,
                        shape: const StadiumBorder(),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Assets.icons.icDot.toGetSvgWithColor(
                            color: JobStatus.late.dotColor,
                          ),
                          AutoSizeText(
                            JobStatus.late.status,
                            style:
                                textTheme.titleSmall!.copyWith(fontSize: 10.sp),
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
        const AutoSizeText('Lobi Bar'),
        SizedBox(
          width: 8.w,
        ),
        buildCustomCircleWidget(
          const Center(child: AutoSizeText('D')),
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

  Future<bool?> buildDeleteShowModelBottomSheet(BuildContext context) {
    return showModalBottomSheet<bool>(
      isScrollControlled: true,
      context: context,
      showDragHandle: true,
      builder: (BuildContext context) {
        return CustomDeleteShowModelBottomSheet(
          ctx: context,
        );
      },
    );
  }

  Padding buildCustomButton({
    required BuildContext context,
    required String text,
    Color? backgroundColor,
    Color? textColor,
    Object? value,
  }) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: SizedBox(
        height: 56.h,
        width: context.sized.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? ColorName.blueBase,
          ),
          onPressed: () {
            context.router.pop(value);
          },
          child: AutoSizeText(
            text.tr(),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: textColor ?? ColorName.neutral0,
                ),
          ),
        ),
      ),
    );
  }

  Future<void> buildSuccessOperationModelBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      showDragHandle: true,
      builder: (BuildContext context) {
        return const CustomSuccessModelBottomSheetContent(
          text: 'Shift başarılı bir şekilde silindi',
        );
      },
    );
  }
}
