import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_autosizetext_for_title.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/department_model.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/mixin/add_department_form_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/widgets/custom_divider.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/add_department_form_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/state/add_department_form_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

@RoutePage<DepartmentModel>()
class AddDepartmentFormView extends StatefulWidget {
  const AddDepartmentFormView({super.key});

  @override
  State<AddDepartmentFormView> createState() => _AddDepartmentFormViewState();
}

class _AddDepartmentFormViewState extends BaseState<AddDepartmentFormView>
    with AddDepartmentFormMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => addDepartmentFormBloc,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: ColorName.neutral100,
          centerTitle: true,
          title:
              AutoSizeText(LocaleKeys.setup_company_info_add_department.tr()),
        ),
        body: Padding(
          padding: const ProjectPadding.scaffold(),
          child: Column(
            children: [
              Flexible(
                flex: 8,
                child: ListView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.only(top: 34).r,
                  children: [
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildCustomTextFormField(
                            title: LocaleKeys.setup_company_info_company_name,
                            controller: companyNameController,
                            hint: LocaleKeys
                                .setup_add_department_department_name_hint,
                          ),
                          Padding(
                            padding: const ProjectPadding.symmetricNormalV(),
                            child: buildCustomTextFormField(
                              title: LocaleKeys
                                  .setup_add_department_department_manager,
                              controller: departmentManagerNameController,
                              hint: LocaleKeys
                                  .setup_add_department_department_manager_hint,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Assets.icons.icUser2.toGetSvg(),
                              ),
                            ),
                          ),
                          buildCustomTextFormField(
                            title: LocaleKeys.setup_company_info_company_name,
                            controller: departmentManagerMailController,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Assets.icons.icMail.toGetSvg(),
                            ),
                            hint: LocaleKeys
                                .setup_add_department_department_manager_mail_hint,
                          ),
                          Padding(
                            padding: const ProjectPadding.symmetricNormalV()
                                .copyWith(bottom: 0),
                            child: buildPhoneNumber(context),
                          ),
                          const CustomDivider(
                            title: LocaleKeys.setup_add_department_part,
                          ),
                          buildDepartmentSwitch(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              buildButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Flexible buildButton(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 58.h,
        width: context.sized.width,
        child: BlocBuilder<AddDepartmentFormBloc, AddDepartmentFormState>(
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                context.router.pop<DepartmentModel>(state.departmentModel);
              },
              child: AutoSizeText(
                LocaleKeys.setup_add_department_button.tr(),
                style:
                    textTheme.titleLarge!.copyWith(color: ColorName.neutral0),
              ),
            );
          },
        ),
      ),
    );
  }

  Container buildDepartmentSwitch(BuildContext context) {
    return Container(
      padding: const ProjectPadding.allMedium(),
      height: 72.h,
      width: context.sized.width,
      decoration: BoxDecoration(
        borderRadius: ProjectBorderRadius.allCircleMedium(),
        border: Border.all(color: ColorName.neutral200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                LocaleKeys.setup_add_department_is_part_of_department.tr(),
                style: textTheme.titleMedium!
                    .copyWith(color: ColorName.neutral900),
              ),
              SizedBox(
                height: 20.h,
                child: CupertinoSwitch(
                  activeColor: ColorName.blueBase,
                  value: false,
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
          AutoSizeText(
            LocaleKeys.setup_add_department_is_part_of_department_info.tr(),
            style: textTheme.titleSmall!.copyWith(color: ColorName.neutral500),
          ),
        ],
      ),
    );
  }

  Column buildCustomTextFormField({
    required TextEditingController controller,
    required String title,
    required String hint,
    Widget? prefixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const ProjectPadding.symmetricXSmallV(),
          child: CustomAutoSizeTextForTitle(
            text: title,
          ),
        ),
        BlocBuilder<AddDepartmentFormBloc, AddDepartmentFormState>(
          builder: (context, state) {
            return TextFormField(
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
                addDepartmentFormBloc
                    .changeCompanyName(companyNameController.text);
                addDepartmentFormBloc
                    .changeManagerMail(departmentManagerMailController.text);
                addDepartmentFormBloc
                    .changeManagerName(departmentManagerNameController.text);
                addDepartmentFormBloc
                    .changeManagerPhone(phoneEditingController.text);

                addDepartmentFormBloc.changeModel(
                  DepartmentModel(
                    companyName: state.companyName.toString(),
                    departmentManager: state.departmentManagerName.toString(),
                    managerMail: state.departmentManagerMail.toString(),
                    managerPhone: state.departmentManagerNumber.toString(),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Column buildPhoneNumber(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const ProjectPadding.symmetricXSmallV(),
          child: buildAutoSize(LocaleKeys.add_personnel_base_inform_tel_no),
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
          controller: phoneEditingController,
          decoration: InputDecoration(
            fillColor: ColorName.neutral100,
            filled: true,
            hintText: LocaleKeys.add_personnel_base_inform_tel_no_hint.tr(),
            isDense: true,
            contentPadding: const EdgeInsets.fromLTRB(0, 10, 10, 0).r,
          ),
          initialCountryCode: initialCountry,
          searchText: LocaleKeys.add_personnel_base_inform_phone_dial.tr(),
          onChanged: (value) {},
          style: textTheme.titleMedium,
        ),
      ],
    );
  }

  AutoSizeText buildAutoSize(String text) {
    return AutoSizeText(
      text.tr(),
      style: Theme.of(context).textTheme.labelMedium,
    );
  }
}
