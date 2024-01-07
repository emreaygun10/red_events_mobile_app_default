import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/add_personnel_view_model.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/mixin/hr_informations_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/state/add_personnel_state.dart';
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
    const selectedValue = '';
    return ListView(
      padding: EdgeInsets.zero,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        BlocBuilder<AddPersonnelViewModel, AddPersonnelState>(
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
                buildContinueButton(context, widget.pageController),
              ],
            ),
          ),
        ),
      ],
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
          child: SizedBox(
            height: 40.h,
            child: DropdownButtonFormField<String>(
              icon: Assets.icons.icDownArrow.svg(
                package: ModuleEnum.gen.value,
              ),
              decoration: InputDecoration(
                hintText: hint.tr(),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorName.neutral300,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorName.neutral300,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: focusNodes[1].hasFocus,
                fillColor: ColorName.blueLighter,
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(15, 15, 10, 15).r,
              ),
              validator: (value) => value == null ? 'Select a country' : null,
              dropdownColor: ColorName.blueLighter,
              value: selectedValue,
              onChanged: (String? newValue) {
                /// TODO selected = new
              },
              items: const [],
            ),
          ),
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
            height: 40.h,
            decoration: BoxDecoration(
              border: Border.all(color: ColorName.neutral200, width: 2),
              borderRadius: ProjectBorderRadius.allCircleSmall().r,
            ),
            child: Padding(
              padding: const ProjectPadding.allXSmall(),
              child: BlocBuilder<AddPersonnelViewModel, AddPersonnelState>(
                builder: (context, state) {
                  return TextFormField(
                    focusNode: focusNodes[2],
                    onTap: () => buildShowModalBottomSheetBirthDate(context),
                    showCursor: false,
                    keyboardType: TextInputType.none,
                    controller: birthDateEditingController,
                    decoration: InputDecoration(
                      fillColor: ColorName.blueLighter,
                      filled: state.birthDateFocus,
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
              pageController.jumpToPage(2);
              addPersonnelViewModel.changeLinearProgress(
                LinearProgressEnum.levelThree,
              );
            },
            child: AutoSizeText(
              LocaleKeys.add_personnel_buttons_continue.tr(),
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
