import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/add_personnel_view_model.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/mixin/add_personnel_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/state/add_personnel_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/linearprogress_enums.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_divider.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_personnel_top_stack.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
final class BaseInformationView extends StatefulWidget {
  const BaseInformationView({super.key});

  @override
  State<BaseInformationView> createState() => _BaseInformationViewState();
}

class _BaseInformationViewState extends BaseState<BaseInformationView>
    with AddPersonnelMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => addPersonnelViewModel,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: buildAppBar(),
        body: ListView(
          padding: EdgeInsets.zero,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            const CustomPersonnelTopStack(
              linearProgressEnum: LinearProgressEnum.levelOne,
            ),
            buildPhotoSelector(),
            Padding(
              padding: const ProjectPadding.scaffold(),
              child: buildForm(context),
            ),
            Padding(
              padding: const ProjectPadding.symmetricLargeV(),
              child: Padding(
                padding: const ProjectPadding.scaffold(),
                child: SizedBox(
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: () {},
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
            ),
          ],
        ),
      ),
    );
  }

  Form buildForm(
    BuildContext context,
  ) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: const ProjectPadding.symmetricLargeV(),
            child: buildNameSurnameTextFormField(
              context,
              nameSurnameEditingController,
            ),
          ),
          buildTcTExtFormField(
            context,
            tcNoEditingController,
          ),
          Padding(
            padding: const ProjectPadding.symmetricLargeV(),
            child: buildBirthDateTextFormField(context),
          ),
          buildPhoneNumber(context),
          Padding(
            padding: const ProjectPadding.symmetricLargeV(),
            child: buildDropdownCity(context),
          ),
          buildDropdownButtonFormFieldNeighborhood(context),
        ],
      ),
    );
  }

  AutoSizeText buildAutoSize(String text) {
    return AutoSizeText(
      text.tr(),
      style: Theme.of(context).textTheme.labelSmall,
    );
  }

  Column buildDropdownCity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildAutoSize(LocaleKeys.add_personnel_base_inform_city),
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
                    showCursor: false,
                    focusNode: focusNodes[4],
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const ProjectPadding.allXSmall(),
                        child: Assets.icons.icHome.svg(
                          package: ModuleEnum.gen.value,
                        ),
                      ),
                      suffixIcon: Assets.icons.icDownArrow
                          .svg(package: ModuleEnum.gen.value),
                      filled: state.cityFocus,
                      fillColor: ColorName.blueLighter,
                      hintText:
                          LocaleKeys.add_personnel_base_inform_city_hint.tr(),
                    ),
                    onTap: () {
                      /// TODO: showBottomModelView for cities
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column buildDropdownButtonFormFieldNeighborhood(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildAutoSize(LocaleKeys.add_personnel_base_inform_neighborhood),
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
                    focusNode: focusNodes[5],
                    showCursor: false,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const ProjectPadding.allXSmall(),
                        child: Assets.icons.icHomeOffice
                            .svg(package: ModuleEnum.gen.value),
                      ),
                      hintText:
                          LocaleKeys.add_personnel_base_inform_city_hint.tr(),
                      suffixIcon: Assets.icons.icDownArrow
                          .svg(package: ModuleEnum.gen.value),
                      filled: state.neighborhoodFocus,
                      fillColor: ColorName.blueLighter,
                    ),
                    onTap: () {
                      /// TODO: showBottomModelView for neighborhoods
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column buildPhoneNumber(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildAutoSize(LocaleKeys.add_personnel_base_inform_tel_no),
        BlocBuilder<AddPersonnelViewModel, AddPersonnelState>(
          builder: (context, state) {
            return SizedBox(
              child: Padding(
                padding: const ProjectPadding.allXSmall(),
                child: IntlPhoneField(
                  focusNode: focusNodes[3],
                  invalidNumberMessage: LocaleKeys
                      .add_personnel_base_inform_invalid_phone_numer
                      .tr(),
                  dropdownDecoration: const BoxDecoration(
                    color: ColorName.blueLighter,
                  ),
                  controller: phoneEditingController,
                  decoration: InputDecoration(
                    fillColor: ColorName.blueLighter,
                    filled: state.phoneNumberFocus,
                    hintText:
                        LocaleKeys.add_personnel_base_inform_tel_no_hint.tr(),
                    isDense: true,
                    contentPadding: const EdgeInsets.fromLTRB(0, 10, 10, 10).r,
                  ),
                  initialCountryCode: initialCountry,
                  searchText:
                      LocaleKeys.add_personnel_base_inform_phone_dial.tr(),
                  onChanged: changePhoneNumber,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Column buildBirthDateTextFormField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildAutoSize(LocaleKeys.add_personnel_base_inform_birt_date),
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
                  view: DateRangePickerView.year,
                  onSelectionChanged: onSelectionChanged,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Column buildTcTExtFormField(
    BuildContext context,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildAutoSize(LocaleKeys.add_personnel_base_inform_tc),
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
                    keyboardType: TextInputType.number,
                    focusNode: focusNodes[1],
                    controller: controller,
                    decoration: InputDecoration(
                      fillColor: ColorName.blueLighter,
                      filled: state.tcFocus,
                      hintText:
                          LocaleKeys.add_personnel_base_inform_tc_hint.tr(),
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

  Column buildNameSurnameTextFormField(
    BuildContext context,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildAutoSize(LocaleKeys.add_personnel_base_inform_name_surname),
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
                    focusNode: focusNodes[0],
                    controller: controller,
                    decoration: InputDecoration(
                      fillColor: ColorName.blueLighter,
                      filled: state.nameSurnameFocus,
                      hintText: LocaleKeys
                          .add_personnel_base_inform_name_surname_hint
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

  GestureDetector buildPhotoSelector() {
    return GestureDetector(
      onTap: () async {
        await showDialog2();
      },
      child: Center(
        child: SizedBox(
          height: 80.h,
          child: BlocBuilder<AddPersonnelViewModel, AddPersonnelState>(
            builder: (context, state) {
              return Stack(
                alignment: state.isImageSelected
                    ? Alignment.center
                    : Alignment.bottomRight,
                children: [
                  Container(
                    height: 80.h,
                    width: 80.w,
                    decoration: const BoxDecoration(
                      color: ColorName.neutral200,
                      shape: BoxShape.circle,
                    ),
                    child: state.isImageSelected
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.file(
                              state.imageFile!,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        : Assets.icons.icPickPerson
                            .svg(package: ModuleEnum.gen.value),
                  ),
                  if (!state.isImageSelected)
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: ColorName.blueLight,
                        shape: BoxShape.circle,
                      ),
                      child: Assets.icons.icCamera
                          .svg(package: ModuleEnum.gen.value),
                    )
                  else
                    const SizedBox(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Assets.icons.icLogoDark
          .svg(package: ModuleEnum.gen.value, height: 40, width: 40),
      backgroundColor: Colors.transparent,
      leadingWidth: 70.w,
      leading: InkWell(
        onTap: () => context.router.pop(),
        child: Padding(
          padding: const ProjectPadding.scaffold(),
          child: Container(
            padding: const EdgeInsets.all(6),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: ColorName.blueLight,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Assets.icons.icArrowLeftLine.svg(
                package: ModuleEnum.gen.value,
                color: ColorName.blueBase,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// TODO: Show bottom for adroid
  Future<dynamic> showDialog2() {
    return Platform.isAndroid
        ? showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return Container();
            },
          )
        : showCupertinoModalPopup(
            context: context,
            builder: (context) => CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                  child: const Text(LocaleKeys.general_button_gallery).tr(),
                  onPressed: () async {
                    // close the options modal
                    Navigator.of(context).pop();
                    // get image from gallery
                    await getPhoto(ImageSource.gallery);
                  },
                ),
                CupertinoActionSheetAction(
                  child: const Text(LocaleKeys.general_button_camera).tr(),
                  onPressed: () async {
                    // close the options modal
                    Navigator.of(context).pop();
                    // get image from camera
                    await getPhoto(ImageSource.camera);
                  },
                ),
              ],
            ),
          );
  }
}
