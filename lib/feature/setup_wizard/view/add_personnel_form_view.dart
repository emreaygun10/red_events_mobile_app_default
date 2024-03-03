import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_autosizetext_for_title.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/peronnel_model.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/mixin/add_personnel_form_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/widgets/custom_divider.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/add_personnel_form_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/state/add_personnel_form_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
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
        appBar: buildAppBar(),
        body: Column(
          children: [
            Flexible(
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
                        padding: const EdgeInsets.all(8),
                        child: Assets.icons.icUserLine.toGetSvg(),
                      ),
                    ),
                    buildCustomTextFormField(
                      title: LocaleKeys.setup_personnel_form_tc,
                      controller: tcController,
                      hint: LocaleKeys.setup_personnel_form_tc,
                    ),

                    ///TODO : birtdate
                    buildCustomTextFormField(
                      title: LocaleKeys.setup_personnel_form_mail,
                      controller: mailController,
                      hint: LocaleKeys.setup_personnel_form_mail,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
                onChanged: (value) {},
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
            onChanged: (value) {},
            style: textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
