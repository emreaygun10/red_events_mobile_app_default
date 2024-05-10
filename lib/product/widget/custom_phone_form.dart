import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:widgets/widgets.dart';

class CustomPhoneNumber extends StatelessWidget {
  const CustomPhoneNumber({
    required this.initialCountry,
    required this.textEditingController,
    super.key,
  });

  final String? initialCountry;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      invalidNumberMessage:
          LocaleKeys.add_personnel_base_inform_invalid_phone_numer.tr(),
      pickerDialogStyle: PickerDialogStyle(
        backgroundColor: ColorName.neutral0,
        padding: const ProjectPadding.allLarge(),
        countryNameStyle: Theme.of(context).textTheme.titleLarge,
        countryCodeStyle: Theme.of(context).textTheme.labelMedium,
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
      controller: textEditingController,
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
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
