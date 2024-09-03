import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/mixin/add_personnel_daily_form_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/widgets/custom_bottom_button.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_enforced_title.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_form_title.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_phone_form.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class AddPersonnelDailyFormView extends StatefulWidget {
  const AddPersonnelDailyFormView({super.key});

  @override
  State<AddPersonnelDailyFormView> createState() =>
      _AddPersonnelDailyFormViewState();
}

class _AddPersonnelDailyFormViewState
    extends BaseState<AddPersonnelDailyFormView>
    with AddPersonnelDailyFormMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: buildCustomBottomButton(),
      ),
      backgroundColor: ColorName.neutral0,
      appBar: AppBar(
        backgroundColor: ColorName.neutral0,
        surfaceTintColor: ColorName.neutral0,
        title: Text(
          'Personnel Ekle (1/2)',
          style: textTheme.titleLarge,
        ),
      ),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: const ProjectPadding.scaffold(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PERSONEL BİLGİLERİ',
                      style: textTheme.titleSmall!.copyWith(
                        color: ColorName.neutral400,
                      ),
                    ),
                    padding(),
                    buildDottedContainer(context),
                    padding(),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: CustomEnforcedTitle(
                        title: LocaleKeys.add_personnel_base_inform_name_surname
                            .tr(),
                      ),
                    ),
                    buildCustomNameTextFormField(),
                    padding(),
                    const CustomFormTitle(
                      title: 'Görev Yeri',
                    ),
                    buildMissionLocationTextFormField(
                      context: context,
                      hintText:
                          LocaleKeys.profile_change_shift_select_hint.tr(),
                    ),
                    padding(),
                    const CustomFormTitle(
                      title: 'Görev Yeri',
                    ),
                    buildMissionLocationTextFormField(
                      context: context,
                      hintText:
                          '${LocaleKeys.profile_change_shift_select_hint.tr()} (opsiyonel)',
                    ),
                    padding(),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: CustomEnforcedTitle(
                        title:
                            LocaleKeys.profile_profile_detail_phone_number.tr(),
                      ),
                    ),
                    CustomPhoneNumber(
                      textEditingController: TextEditingController(),
                      initialCountry: initialCountry,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  CustomBottomButton buildCustomBottomButton() {
    return CustomBottomButton(
      textTheme: textTheme,
      backgroundColor: ColorName.blueBase,
      textColor: ColorName.neutral0,
      onTap: () =>
          context.router.push(const AddPersonnelDailyFormDocumentsRoute()),
      text: LocaleKeys.general_button_continue.tr(),
    );
  }

  /// TODO: controller focus node falan ekle
  TextFormField buildMissionLocationTextFormField({
    required BuildContext context,
    required String hintText,
  }) {
    return TextFormField(
      onTap: () async => showModalBottomSheet(
        context: context,
        builder: (context) => Container(),
      ),
      readOnly: true,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const ProjectPadding.allMedium(),
        border: OutlineInputBorder(
          borderRadius: ProjectBorderRadius.allCircleNormal(),
        ),
        suffix: Assets.icons.icDownArrow.toGetSvgWithColor(
          color: ColorName.neutral500,
          height: 20.h,
        ),
      ),
    );
  }

  TextFormField buildCustomNameTextFormField() {
    return TextFormField(
      focusNode: FocusNode(),
      controller: TextEditingController(),
      decoration: InputDecoration(
        fillColor: ColorName.blueLighter,
        filled: false,
        hintText: LocaleKeys.add_personnel_base_inform_name_surname.tr(),
        isDense: true,
        prefixIcon: SizedBox(
          width: 40.w,
          child: Assets.icons.icUserLine.toGetSvg(),
        ),
        prefixIconConstraints: BoxConstraints(maxHeight: 20.h, minHeight: 20.h),
      ),
      style: textTheme.titleMedium,
    );
  }

  SizedBox padding() => SizedBox(
        height: 19.h,
      );

  SizedBox buildDottedContainer(BuildContext context) {
    return SizedBox(
      height: 72.h,
      width: context.sized.width,
      child: DottedBorder(
        color: ColorName.neutral300,
        borderType: BorderType.RRect,
        radius: const Radius.circular(12).r,
        dashPattern: const [8, 8, 8, 8],
        child: Padding(
          padding: const ProjectPadding.allMedium(),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: Assets.images.imageUserBackground
                          .provider(package: ModuleEnum.gen.value),
                    ),
                    Padding(
                      padding: const ProjectPadding.symmetricMediumH(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fotoraf Ekle',
                            style: textTheme.titleMedium!.copyWith(),
                          ),
                          Text(
                            'Maks 10 mb',
                            style: textTheme.titleSmall!.copyWith(
                              color: ColorName.neutral500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Assets.icons.icPlus.svg(package: ModuleEnum.gen.value),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
