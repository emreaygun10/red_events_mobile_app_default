import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/mixin/hr_informations_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_autosizetext_for_title.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/peronnel_model.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/mixin/add_personnel_form_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/widgets/custom_divider.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/add_personnel_form_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/state/add_personnel_form_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:widgets/widgets.dart';

@RoutePage<PersonnelModel>()
class AddPersonnelFormView extends StatefulWidget {
  const AddPersonnelFormView({super.key});

  @override
  State<AddPersonnelFormView> createState() => _AddPersonnelFormViewState();
}

class _AddPersonnelFormViewState extends BaseState<AddPersonnelFormView>
    with AddPersonnelFormMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => addPersonnelFormBloc,
      child: Scaffold(
        bottomNavigationBar: birthDateNavigationButton(),
        appBar: buildAppBar(),
        body: Column(
          children: [
            Expanded(
              child: Form(
                child: ListView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: EdgeInsets.zero,
                  children: [
                    buildCustomTextFormField(
                      title: LocaleKeys.setup_personnel_form_name_surname,
                      controller: nameSurnameController,
                      hint: LocaleKeys.setup_personnel_form_name_surname,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(11).r,
                        child: Assets.icons.icUserLine.toGetSvg(),
                      ),
                    ),
                    buildCustomTextFormField(
                      title: LocaleKeys.setup_personnel_form_tc,
                      controller: tcController,
                      hint: LocaleKeys.setup_personnel_form_tc,
                    ),
                    buildDate(
                      context: context,
                      title: LocaleKeys.setup_personnel_form_birtdate,
                    ),
                    buildCustomTextFormField(
                      title: LocaleKeys.setup_personnel_form_mail,
                      controller: mailController,
                      hint: LocaleKeys.setup_personnel_form_mail,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(11).r,
                        child: Assets.icons.icMail.toGetSvg(),
                      ),
                    ),
                    buildPhoneNumber(
                      context,
                      LocaleKeys.setup_personnel_form_phone_number,
                    ),
                    const CustomDivider(
                      title: LocaleKeys.setup_personnel_form_workinfo_title,
                    ),
                    buildDropdown(
                      title: LocaleKeys.setup_personnel_form_workinfo_work_type,
                      items: workTypeList,
                      onChanged: (p0) {
                        addPersonnelFormBloc.changeWorkType(p0);
                      },
                    ),
                    buildDropdown(
                      title:
                          LocaleKeys.setup_personnel_form_workinfo_departmanent,
                      items: departmentList,
                      onChanged: (p0) {
                        addPersonnelFormBloc.changeDepartment(p0);
                      },
                    ),
                    buildDropdown(
                      title: LocaleKeys.setup_personnel_form_workinfo_part,
                      items: partList,
                      onChanged: (p0) {
                        addPersonnelFormBloc.changePart(p0);
                      },
                    ),
                    buildDropdown(
                      title: LocaleKeys.setup_personnel_form_workinfo_mission,
                      items: missionList,
                      onChanged: (p0) {
                        addPersonnelFormBloc.changeMission(p0);
                      },
                    ),
                    buildDate(
                      context: context,
                      title:
                          LocaleKeys.setup_personnel_form_workinfo_start_date,
                    ),
                    buildCurrencyColumn(
                      LocaleKeys.setup_personnel_form_workinfo_salary,
                    ),
                    buildBottomButton(context),
                    SizedBox(
                      height: 40.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildBottomButton(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: SizedBox(
        height: 56.h,
        width: context.sized.width,
        child: BlocBuilder<AddPersonnelFormBloc, AddPersonnelFormState>(
          builder: (context, state) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorName.blueBase,
              ),
              onPressed: () {
                context.router.pop<PersonnelModel>(
                  PersonnelModel(
                    nameSurname: state.nameSurname.toString(),
                    tcNo: state.tcNo.toString(),
                    birthdate: state.birthdate.toString(),
                    mail: state.mail.toString(),
                    phoneNumber: state.phoneNumber.toString(),
                    workType: state.workType.toString(),
                    department: state.department.toString(),
                    part: state.part.toString(),
                    mission: state.part.toString(),
                    startDate: state.startDate.toString(),
                    salary: state.salary.toString(),
                  ),
                );
              },
              child: AutoSizeText(
                'Devam Et',
                style: textTheme.titleLarge!.copyWith(
                  color: ColorName.neutral0,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  SolidBottomSheet birthDateNavigationButton() {
    return SolidBottomSheet(
      maxHeight: 350.h,
      controller: bottomSheetController,
      headerBar: const SizedBox(),
      body: Padding(
        padding: const ProjectPadding.symmetricNormalH(),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: ColorName.blueBase),
            color: ColorName.neutral0,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const ProjectPadding.allMedium(),
          child: Column(
            children: [
              BlocBuilder<AddPersonnelFormBloc, AddPersonnelFormState>(
                builder: (context, state) {
                  return SfDateRangePicker(
                    selectionColor: ColorName.blueBase,
                    showNavigationArrow: true,
                    minDate: DateTime(1900),
                    maxDate: DateTime(2020),
                    initialDisplayDate: DateTime(2000, 10, 10),
                    initialSelectedDate: DateTime(2000, 10, 10),
                    view: DateRangePickerView.decade,
                    onSelectionChanged: (args) {
                      if (state.isStartDate) {
                        startDateController.text = args.value.toString();
                        addPersonnelFormBloc
                            .changeStartDate(startDateController.text);
                      } else {
                        birthdateController.text = args.value.toString();
                        addPersonnelFormBloc
                            .changeBirtDate(birthdateController.text);
                      }
                      bottomSheetController.hide();
                    },
                  );
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildDropdown({
    required String title,
    required List<String> items,
    required void Function(String) onChanged,
  }) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const ProjectPadding.symmetricXSmallV().copyWith(top: 19).r,
            child: CustomAutoSizeTextForTitle(
              text: title,
            ),
          ),
          CustomDropdown(
            decoration: CustomDropdownDecoration(
              expandedFillColor: ColorName.neutral0,
              closedFillColor: ColorName.neutral100,
              closedBorder: Border.all(color: ColorName.neutral200, width: 2),
            ),
            items: items,
            onChanged: onChanged,
            initialItem: items.first,
          ),
        ],
      ),
    );
  }

  Column buildDate({
    required BuildContext context,
    required String title,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const ProjectPadding.symmetricXSmallV()
              .copyWith(left: 20, top: 19)
              .r,
          child: CustomAutoSizeTextForTitle(
            text: title,
          ),
        ),
        Padding(
          padding: const ProjectPadding.scaffold(),
          child: GestureDetector(
            onTap: () {
              bottomSheetController.isOpened
                  ? null
                  : bottomSheetController.show();
            },
            child: Container(
              padding: const EdgeInsets.only(left: 12).r,
              height: 48.h,
              width: context.sized.width,
              decoration: BoxDecoration(
                border: Border.all(color: ColorName.neutral300),
                borderRadius: BorderRadius.circular(8).r,
              ),
              child: Row(
                children: [
                  Assets.icons.icCalendar.toGetSvg(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: AutoSizeText(
                      '01/01/2000',
                      style: textTheme.titleMedium!
                          .copyWith(color: ColorName.neutral500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: AutoSizeText(LocaleKeys.setup_personnel_form_title.tr()),
      actions: [
        TextButton(
          onPressed: () {
            /// TODO: clear page
          },
          child: AutoSizeText(
            'Sil',
            style: textTheme.titleLarge!.copyWith(color: ColorName.neutral500),
          ),
        ),
      ],
    );
  }

  Padding buildCustomTextFormField({
    required TextEditingController controller,
    required String title,
    required String hint,
    Widget? prefixIcon,
  }) {
    return Padding(
      padding: const ProjectPadding.scaffold().copyWith(top: 19).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const ProjectPadding.symmetricXSmallV(),
            child: CustomAutoSizeTextForTitle(
              text: title,
            ),
          ),
          BlocBuilder<AddPersonnelFormBloc, AddPersonnelFormState>(
            builder: (context, state) {
              return SizedBox(
                height: 48.h,
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    prefixIcon: prefixIcon,
                    hintText: hint.tr(),
                    filled: true,
                    fillColor: ColorName.neutral100,
                    border: OutlineInputBorder(
                      borderRadius: ProjectBorderRadius.allCircleMedium(),
                    ),
                  ),
                  onChanged: (value) {
                    addPersonnelFormBloc
                      ..changeName(nameSurnameController.text)
                      ..changetc(tcController.text)
                      ..changeManagerMail(mailController.text);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Padding buildPhoneNumber(BuildContext context, String title) {
    return Padding(
      padding: const ProjectPadding.scaffold().copyWith(top: 19).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const ProjectPadding.symmetricXSmallV(),
            child: CustomAutoSizeTextForTitle(
              text: title,
            ),
          ),
          IntlPhoneField(
            invalidNumberMessage:
                LocaleKeys.add_personnel_base_inform_invalid_phone_numer.tr(),
            pickerDialogStyle: PickerDialogStyle(
              backgroundColor: ColorName.neutral0,
              padding: const ProjectPadding.allLarge(),
              countryNameStyle: textTheme.titleLarge,
              countryCodeStyle: textTheme.labelMedium,
            ),
            dropdownDecoration: BoxDecoration(
              border: const Border(
                left: BorderSide(color: ColorName.blueBase),
                top: BorderSide(color: ColorName.blueBase),
                bottom: BorderSide(color: ColorName.blueBase),
              ),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(8).r,
                bottomLeft: const Radius.circular(8).r,
              ),
              color: ColorName.blueLighter,
            ),
            controller: phoneNumberController,
            decoration: InputDecoration(
              fillColor: ColorName.neutral100,
              filled: true,
              hintText: LocaleKeys.add_personnel_base_inform_tel_no_hint.tr(),
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(0, 10, 10, 0).r,
            ),
            initialCountryCode: initialCountry,
            searchText: LocaleKeys.add_personnel_base_inform_phone_dial.tr(),
            onChanged: (value) {
              addPersonnelFormBloc.changePhone(phoneNumberController.text);
            },
            style: textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Padding buildCurrencyColumn(String title) {
    return Padding(
      padding: const ProjectPadding.scaffold().copyWith(top: 19, bottom: 19).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAutoSizeTextForTitle(
            text: title,
          ),
          Padding(
            padding: const ProjectPadding.symmetricSmallV(),
            child: Container(
              height: 45.h,
              width: context.sized.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10).r,
                border: Border.all(
                  color: ColorName.neutral300,
                ),
              ),
              child: buildTextFormFieldRow(),
            ),
          ),
        ],
      ),
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
              onChanged: (value) {
                addPersonnelFormBloc.changeSalary(value);
              },
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
      child: DropdownButton<CustomCurrency>(
        icon: Assets.icons.icDownArrow.toGetSvg(),
        underline: const SizedBox(),
        borderRadius: BorderRadius.circular(
          24,
        ).r,
        value: currencyList.first,
        onChanged: (CustomCurrency? newValue) {},
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
      ),
    );
  }
}
