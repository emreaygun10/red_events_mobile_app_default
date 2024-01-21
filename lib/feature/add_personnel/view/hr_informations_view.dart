import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/hr_information_view_model.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/mixin/hr_informations_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/state/hr_information_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/linearprogress_enums.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_divider.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_personnel_top_stack.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:widgets/widgets.dart';

class HrInformationView extends StatefulWidget {
  const HrInformationView({
    required this.context,
    required this.pageController,
    super.key,
  });

  final BuildContext context;
  final PageController pageController;
  @override
  State<HrInformationView> createState() => _HrInformationViewState();
}

class _HrInformationViewState extends BaseState<HrInformationView>
    with HrInformationMixin {
  @override
  Widget build(BuildContext context) {
    const selectedValue = 'EURO';
    return BlocProvider(
      create: (context) => hrInformationViewModel,
      child: ListView(
        padding: EdgeInsets.zero,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          BlocBuilder<HrInformationCubit, HrInformationState>(
            builder: (context, state) {
              return CustomPersonnelTopStack(
                linearProgressEnum: state.linearProgressEnum,
                text: LocaleKeys.add_personnel_hr_inform_hr_inform,
              );
            },
          ),
          Padding(
            padding: const ProjectPadding.scaffold(),
            child: Form(
              child: Column(
                children: [
                  buildStartedDateTextFormField(context),
                  Padding(
                    padding: const ProjectPadding.symmetricLargeV(),
                    child: buildCustomDropdown(
                      selectedValue: selectedValue,
                      title: LocaleKeys.add_personnel_hr_inform_departmant,
                      hint: LocaleKeys.add_personnel_hr_inform_departmant_hint,
                      items: List.empty(),
                    ),
                  ),
                  buildCustomDropdown(
                    selectedValue: selectedValue,
                    title: LocaleKeys.add_personnel_hr_inform_section,
                    hint: LocaleKeys.add_personnel_hr_inform_section_hint,
                    items: List.empty(),
                  ),
                  Padding(
                    padding: const ProjectPadding.symmetricLargeV(),
                    child: buildCustomDropdown(
                      selectedValue: selectedValue,
                      title: LocaleKeys.add_personnel_hr_inform_work_type,
                      hint: LocaleKeys.add_personnel_hr_inform_work_type_hint,
                      items: List.empty(),
                    ),
                  ),
                  buildCustomDropdown(
                    selectedValue: selectedValue,
                    title: LocaleKeys.add_personnel_hr_inform_part,
                    hint: LocaleKeys.add_personnel_hr_inform_part_hint,
                    items: List.empty(),
                  ),
                  buildBlocPriceInfoColumn(),
                  buildContinueButton(context, widget.pageController),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BlocBuilder<HrInformationCubit, HrInformationState>
      buildBlocPriceInfoColumn() {
    return BlocBuilder<HrInformationCubit, HrInformationState>(
      builder: (context, state) {
        if (hrInformationViewModel.state.isPriceInfoBool) {
          return buildPriceInfoColumn(context);
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Column buildPriceInfoColumn(
    BuildContext context,
  ) {
    return Column(
      children: [
        Padding(
          padding: const ProjectPadding.symmetricLargeV(),
          child: buildPriceInfoText(context),
        ),
        buildCurrencyColumn(
          LocaleKeys
              .add_personnel_hr_inform_price_information_mountly_price_information,
        ),
        buildCurrencyColumn(
          LocaleKeys
              .add_personnel_hr_inform_price_information_mountly_price_information,
        ),
        buildCurrencyColumn(
          LocaleKeys
              .add_personnel_hr_inform_price_information_mountly_price_information,
        ),
      ],
    );
  }

  Row buildPriceInfoText(BuildContext context) {
    return Row(
      children: [
        AutoSizeText(
          LocaleKeys.add_personnel_hr_inform_price_info.tr(),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: ColorName.neutral400,
              ),
        ),
      ],
    );
  }

  Column buildCurrencyColumn(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildAutoSize(
          title,
        ),
        Padding(
          padding: const ProjectPadding.symmetricSmallV(),
          child: Container(
            height: 45.h,
            width: context.sized.width,
            decoration: BoxDecoration(
              borderRadius: ProjectBorderRadius.allCircleMedium().r,
              border: Border.all(
                color: ColorName.neutral300,
              ),
            ),
            child: buildTextFormFieldRow(),
          ),
        ),
      ],
    );
  }

  Row buildTextFormFieldRow() {
    return Row(
      children: [
        Padding(
          padding: const ProjectPadding.allXSmall(),
          child: SizedBox(
            width: 180.w,
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: ColorName.neutral100,
                contentPadding: const ProjectPadding.allSmall(),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: ColorName.neutral100),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(12).r,
                    topLeft: const Radius.circular(12).r,
                  ).r,
                  borderSide: const BorderSide(
                    color: ColorName.neutral100,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(12).r,
                    bottomLeft: const Radius.circular(12).r,
                  ).r,
                  borderSide: const BorderSide(
                    color: ColorName.blueBase,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const ProjectPadding.onlyRightSmall(),
          child: VerticalDivider(
            color: ColorName.neutral300,
            width: 1.w,
          ),
        ),
        buildDropDownButton(),
      ],
    );
  }

  SizedBox buildDropDownButton() {
    return SizedBox(
      height: 40.h,
      child: BlocBuilder<HrInformationCubit, HrInformationState>(
        builder: (context, state) {
          return DropdownButton<CustomCurrency>(
            icon: Assets.icons.icDownArrow.svg(package: ModuleEnum.gen.value),
            underline: const SizedBox(),
            borderRadius: BorderRadius.circular(
              24,
            ).r,
            value: state.customCurrency,
            onChanged: (CustomCurrency? newValue) {
              hrInformationViewModel
                  .changeCurrencyValue(newValue ?? currencyList.first);
            },
            items: currencyList
                .map<DropdownMenuItem<CustomCurrency>>((CustomCurrency value) {
              return DropdownMenuItem<CustomCurrency>(
                value: value,
                child: SizedBox(
                  width: 100.w,
                  height: 40.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      value.flag,
                      Text(value.currency),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Column buildCustomDropdown({
    required String selectedValue,
    required String title,
    required String hint,
    required List<dynamic> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildAutoSize(
          title,
        ),
        Padding(
          padding: const ProjectPadding.symmetricSmallV(),
          child: DropdownButtonHideUnderline(
            child: CustomDropdown<String>.search(
              hintText: hint.tr(),
              searchHintText: LocaleKeys.add_personnel_hr_inform_search.tr(),
              items: dummyItem,
              excludeSelected: false,
              decoration: CustomDropdownDecoration(
                closedFillColor: ColorName.neutral100,
                closedBorder: Border.all(
                  color: ColorName.neutral300,
                ),
                closedBorderRadius: ProjectBorderRadius.allCircleMedium(),
                expandedBorder: Border.all(color: ColorName.blueBase),
                listItemDecoration: const ListItemDecoration(
                  selectedColor: ColorName.blueBase,
                ),
              ),
              onChanged: (value) {
                print('changing value to: $value');
              },
            ),
          ),

          //  DropdownButtonFormField<String>(
          //   style: textTheme.titleMedium,
          //   decoration: InputDecoration(
          //     hintText: hint.tr(),
          //     enabledBorder: OutlineInputBorder(
          //       borderSide: const BorderSide(
          //         color: ColorName.neutral300,
          //         width: 2,
          //       ),
          //       borderRadius: ProjectBorderRadius.allCircleMedium(),
          //     ),
          //     border: OutlineInputBorder(
          //       borderSide: const BorderSide(
          //         color: ColorName.neutral300,
          //         width: 2,
          //       ),
          //       borderRadius: ProjectBorderRadius.allCircleMedium(),
          //     ),
          //     filled: focusNodes[1].hasFocus,
          //     fillColor: ColorName.blueLighter,
          //     isDense: true,
          //     contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8).r,
          //   ),
          //   validator: (value) => value == null ? 'Select a country' : null,
          //   dropdownColor: ColorName.blueLighter,
          //   value: selectedValue,
          //   onChanged: (String? newValue) {
          //     /// TODO selected = new
          //   },
          //   items: const [],
          // ),
        ),
      ],
    );
  }

  Column buildStartedDateTextFormField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildAutoSize(LocaleKeys.add_personnel_hr_inform_started_date),
        Padding(
          padding: const ProjectPadding.symmetricSmallV(),
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              border: Border.all(color: ColorName.neutral200, width: 2),
              borderRadius: ProjectBorderRadius.allCircleSmall().r,
            ),
            child: Padding(
              padding: const ProjectPadding.allXSmall(),
              child: BlocBuilder<HrInformationCubit, HrInformationState>(
                builder: (context, state) {
                  return TextFormField(
                    focusNode: focusNodes[2],
                    onTap: () => buildShowModalBottomSheetBirthDate(context),
                    showCursor: false,
                    keyboardType: TextInputType.none,
                    controller: birthDateEditingController,
                    decoration: InputDecoration(
                      fillColor: ColorName.blueLighter,
                      filled: state.startedDateFocus,
                      prefixIcon: Padding(
                        padding: const ProjectPadding.allSmall(),
                        child: Assets.icons.icCalendar.svg(
                          package: ModuleEnum.gen.value,
                        ),
                      ),
                      hintText: LocaleKeys
                          .add_personnel_base_inform_birt_date_hint
                          .tr(),
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.fromLTRB(15, 15, 10, 15).r,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> buildShowModalBottomSheetBirthDate(BuildContext context) {
    return showModalBottomSheet<void>(
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
                  selectionColor: ColorName.blueBase,
                  minDate: DateTime(1900),
                  initialSelectedDate: DateTime.now(),
                  maxDate: DateTime(2100),
                  onSelectionChanged: onSelectionChanged,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding buildContinueButton(
    BuildContext context,
    PageController pageController,
  ) {
    return Padding(
      padding: const ProjectPadding.symmetricLargeV(),
      child: Padding(
        padding: const ProjectPadding.scaffold(),
        child: SizedBox(
          height: 56.h,
          width: context.sized.width,
          child: ElevatedButton(
            onPressed: () {
              if (!hrInformationViewModel.state.isPriceInfoBool) {
                hrInformationViewModel.changeIsPriceInfo(value: true);
              } else {
                hrInformationViewModel.changeLinearProgress(
                  LinearProgressEnum.levelThree,
                );
                pageController.nextPage(
                  duration: Durations.short4,
                  curve: Curves.linear,
                );
              }

              /// TODO: Kullanıcı seviyesi
            },
            child: AutoSizeText(
              hrInformationViewModel.state.isPriceInfoBool
                  ? LocaleKeys.general_button_create_personnel.tr()
                  : LocaleKeys.add_personnel_buttons_continue.tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: ColorName.neutral0),
            ),
          ),
        ),
      ),
    );
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    birthDateEditingController.text = args.value.toString().split(' ')[0];
    context.router.pop();
  }

  AutoSizeText buildAutoSize(String text) {
    return AutoSizeText(
      text.tr(),
      style: Theme.of(context).textTheme.labelSmall,
    );
  }
}
