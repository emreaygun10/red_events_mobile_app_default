import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/mixin/add_shift_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/widgets/custom_bottom_sheet_container.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/bloc/add_shift_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/model/day_model.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/state/add_shift_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/manager_enum.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_divider.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_enforced_title.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class AddShiftView extends StatefulWidget {
  const AddShiftView({super.key});

  @override
  State<AddShiftView> createState() => _AddShiftViewState();
}

class _AddShiftViewState extends BaseState<AddShiftView> with AddShiftmixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => addShiftBloc,
      child: Scaffold(
        bottomSheet: buildBottomSheet(context),
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Divider(),
              Padding(
                padding: const ProjectPadding.scaffold(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomEnforcedTitle(
                      title: LocaleKeys.manager_add_shift_shift_info,
                    ),
                    BlocBuilder<AddShiftBloc, AddShiftState>(
                      builder: (context, state) {
                        return CustomBottomSheetContainer(
                          hintText: AddShiftEnums.type.value,
                          onTap: () {
                            addShiftBloc
                                .changeSelectedContainer(AddShiftEnums.type);
                            bottomSheetController.isOpened
                                ? bottomSheetController.hide()
                                : bottomSheetController.show();
                          },
                        );
                      },
                    ),
                    BlocBuilder<AddShiftBloc, AddShiftState>(
                      builder: (context, state) {
                        return CustomBottomSheetContainer(
                          hintText: AddShiftEnums.location.value,
                          onTap: () {
                            addShiftBloc.changeSelectedContainer(
                              AddShiftEnums.location,
                            );
                            bottomSheetController.isOpened
                                ? bottomSheetController.hide()
                                : bottomSheetController.show();
                          },
                        );
                      },
                    ),
                    buildPersonnelCounter(context),
                    buildDateColumn(),
                    BlocBuilder<AddShiftBloc, AddShiftState>(
                      builder: (context, state) {
                        return Card(
                          elevation: 0,
                          color: ColorName.neutral100,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: ColorName.neutral200),
                            borderRadius: ProjectBorderRadius.allCircleMedium(),
                          ),
                          child: Padding(
                            padding: const ProjectPadding.allMedium(),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 247.w,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            LocaleKeys.manager_add_shift_repeat
                                                .tr(),
                                            style:
                                                textTheme.titleMedium!.copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          AutoSizeText(
                                            LocaleKeys
                                                .manager_add_shift_repeat_info
                                                .tr(),
                                            maxLines: 3,
                                            textAlign: TextAlign.start,
                                            style:
                                                textTheme.titleSmall!.copyWith(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Switch(
                                      value: state.isRepeat,
                                      onChanged: (value) {
                                        addShiftBloc.changeIsRepeat(
                                          value: value,
                                        );
                                      },
                                      inactiveTrackColor: ColorName.neutral200,
                                      inactiveThumbColor: ColorName.neutral0,
                                      activeColor: ColorName.neutral0,
                                      activeTrackColor: ColorName.blueBase,
                                    ),
                                  ],
                                ),
                                if (state.isRepeat == true)
                                  Padding(
                                    padding:
                                        const ProjectPadding.symmetricSmallV(),
                                    child: Column(
                                      children: [
                                        const CustomEnforcedTitle(
                                          title: LocaleKeys
                                              .manager_add_shift_repeat_title_info,
                                        ),
                                        CustomBottomSheetContainer(
                                          hintText: LocaleKeys
                                              .manager_add_shift_shift_days_hint,
                                          onTap: () {
                                            BuildSelectDays(context);
                                          },
                                        ),
                                        CustomBottomSheetContainer(
                                          hintText: LocaleKeys
                                              .manager_add_shift_end_date_hint,
                                          selectedText: displayDate(
                                            state.endDate,
                                          ),
                                          onTap: () {
                                            buildCupertinoDatePicker(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                else
                                  const SizedBox(),
                              ],
                            ),
                          ),
                        );
                      },
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

  Future<void> BuildSelectDays(BuildContext context) {
    return showModalBottomSheet<void>(
      enableDrag: false,
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => Padding(
          padding: const ProjectPadding.symmetricSmallH(),
          child: Container(
            padding: const ProjectPadding.symmetricMediumV(),
            height: 550.h,
            decoration: BoxDecoration(
              color: ColorName.neutral0,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ).r,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const ProjectPadding.symmetricMediumV().r,
                  child: AutoSizeText(
                    'Shift Günlerini Seçin',
                    style: textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ColorName.neutral700,
                    ),
                  ),
                ),
                const Divider(),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (
                      context,
                      index,
                    ) {
                      return SizedBox(
                        height: 36,
                        child: Padding(
                          padding: const ProjectPadding.scaffold(),
                          child: CheckboxListTile(
                            onChanged: (value) {
                              setState(() {
                                if (days[index].value) {
                                  days[index] = DayModel(
                                    day: days[index].day,
                                    value: !days[index].value,
                                  );
                                } else {
                                  days[index] = DayModel(
                                    day: days[index].day,
                                    value: !days[index].value,
                                  );
                                }
                              });
                            },
                            value: days[index].value,
                            title: AutoSizeText(days[index].day),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (
                      context,
                      index,
                    ) {
                      return const Divider(
                        color: ColorName.neutral200,
                      );
                    },
                    itemCount: 7,
                  ),
                ),
                Padding(
                  padding: const ProjectPadding.scaffold()
                      .copyWith(bottom: 16, top: 16)
                      .r,
                  child: SizedBox(
                    height: 56,
                    width: context.sized.width,
                    child: ElevatedButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      child: AutoSizeText(
                        'Seç',
                        style: textTheme.titleMedium!
                            .copyWith(color: ColorName.neutral0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> buildCupertinoDatePicker(BuildContext context) {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (_) => Padding(
        padding: const ProjectPadding.symmetricSmallH(),
        child: Container(
          padding: const ProjectPadding.symmetricMediumV(),
          height: 400.h,
          decoration: BoxDecoration(
            color: ColorName.neutral0,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ).r,
          ),
          child: Column(
            children: [
              Padding(
                padding: const ProjectPadding.symmetricMediumV().r,
                child: AutoSizeText(
                  'Bitiş Tarihi',
                  style: textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorName.neutral700,
                  ),
                ),
              ),
              const Divider(),
              SizedBox(
                height: 250.h,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: addShiftBloc.state.endDate ?? DateTime.now(),
                  onDateTimeChanged: (endDate) {
                    addShiftBloc.changeEndDate(endDate);
                  },
                ),
              ),
              TextButton(
                child: const Text('Seç'),
                onPressed: () {
                  if (addShiftBloc.state.endDate == null) {
                    addShiftBloc.changeEndDate(DateTime.now());
                  }
                  context.router.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildDateColumn() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32).r,
      child: Column(
        children: [
          const CustomEnforcedTitle(
            title: LocaleKeys.manager_add_shift_date_title,
          ),
          BlocBuilder<AddShiftBloc, AddShiftState>(
            builder: (context, state) {
              return CustomBottomSheetContainer(
                hintText: LocaleKeys.manager_add_shift_date_hint,
                selectedText: displayDate(state.selectedDate),
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 330.h,
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
                              const CustomDivider(),
                              SfDateRangePicker(
                                controller: dateRangePickerController,
                                selectionColor: ColorName.blueBase,
                                minDate: DateTime(1900),
                                initialSelectedDate: DateTime.now(),
                                maxDate: DateTime(2100),
                                showActionButtons: true,
                                onSubmit: (date) {
                                  changeDate(date! as DateTime);
                                  context.router.pop();
                                },
                                onCancel: () => context.router.pop(),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
          CustomBottomSheetContainer(
            hintText: LocaleKeys.manager_add_shift_hours_hint,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Container buildPersonnelCounter(BuildContext context) {
    return Container(
      padding: const ProjectPadding.allSmall(),
      height: 48.h,
      width: context.sized.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorName.neutral200,
        ),
        borderRadius: ProjectBorderRadius.allCircleMedium(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              addShiftBloc.changePersonelCounterDecrease();
            },
            icon: const Icon(
              Icons.remove,
              color: ColorName.neutral500,
            ),
          ),
          BlocBuilder<AddShiftBloc, AddShiftState>(
            builder: (context, state) {
              return AutoSizeText(
                '${state.personelCounter} kişi',
              );
            },
          ),
          IconButton(
            onPressed: () {
              addShiftBloc.changePersonelCounterIncrease();
            },
            icon: const Icon(
              Icons.add,
              color: ColorName.neutral500,
            ),
          ),
        ],
      ),
    );
  }

  BlocBuilder<AddShiftBloc, AddShiftState> buildBottomSheet(
    BuildContext context,
  ) {
    return BlocBuilder<AddShiftBloc, AddShiftState>(
      builder: (context, state) {
        return SolidBottomSheet(
          controller: bottomSheetController,
          headerBar: const SizedBox(),
          body: Padding(
            padding: const ProjectPadding.symmetricSmallH(),
            child: Container(
              padding: const ProjectPadding.scaffold().copyWith(top: 8).r,
              decoration: BoxDecoration(
                color: ColorName.neutral0,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ).r,
              ),
              width: context.sized.width,
              child: Column(
                children: [
                  Container(
                    width: 32.w,
                    height: 5.h,
                    color: ColorName.neutral200,
                  ),
                  Padding(
                    padding: const ProjectPadding.symmetricMediumV().r,
                    child: AutoSizeText(
                      state.addShiftEnums.value,
                      style: textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorName.neutral700,
                      ),
                    ),
                  ),
                  const Divider(
                    color: ColorName.neutral200,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return RadioListTile(
                          value: index,
                          groupValue: false,
                          onChanged: print,
                          title: const AutoSizeText('List Name'),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                        color: ColorName.neutral200,
                        height: 2.h,
                      ),
                      itemCount: 10,
                    ),
                  ),
                  Padding(
                    padding: const ProjectPadding.symmetricNormalV().r,
                    child: GestureDetector(
                      onTap: () {
                        bottomSheetController.hide();
                      },
                      child: Container(
                        height: 56.h,
                        width: context.sized.width,
                        decoration: BoxDecoration(
                          borderRadius: ProjectBorderRadius.allCircleLarge(),
                          color: ColorName.blueBase,
                        ),
                        child: Center(
                          child: AutoSizeText(
                            'Seç',
                            style: textTheme.titleLarge!
                                .copyWith(color: ColorName.neutral0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: ColorName.neutral100,
      surfaceTintColor: Colors.transparent,
      title: AutoSizeText(
        LocaleKeys.manager_add_shift_title.tr(),
        style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
