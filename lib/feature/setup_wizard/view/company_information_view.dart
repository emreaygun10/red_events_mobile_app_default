import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_autosizetext_for_title.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/mixin/company_information_mixin.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/linearprogress_enums.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_personnel_top_stack.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class CompanyInformationView extends StatefulWidget {
  const CompanyInformationView({super.key});

  @override
  State<CompanyInformationView> createState() => _CompanyInformationViewState();
}

class _CompanyInformationViewState extends BaseState<CompanyInformationView>
    with CompanyInformationMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: buildNavigationButton(context),
      bottomSheet: buildBottomSheet(context),
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(),
      body: ListView(
        //physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          const CustomPersonnelTopStack(
            linearProgressEnum: LinearProgressEnum.levelOneInFive,
            text: LocaleKeys.setup_company_info_title,
            maxLevel: '5',
          ),
          Container(
            width: context.sized.width,
            padding: const ProjectPadding.scaffold(),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAutoSizeTextForTitle(
                    text: LocaleKeys.setup_company_info_company_name,
                  ),
                  buildCompanyNameTextFormField(),
                  Padding(
                    padding: const EdgeInsets.only(top: 16).r,
                    child: const CustomAutoSizeTextForTitle(
                      text: LocaleKeys.setup_company_info_sector,
                    ),
                  ),
                  buildSectorContainer(),
                  buildSectorInfoBox(context),
                ],
              ),
            ),
          ),
          Padding(
            padding: const ProjectPadding.scaffold(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 12).r,
                  child: AutoSizeText(
                    LocaleKeys.setup_company_info_work_model.tr(),
                    style: textTheme.labelMedium!
                        .copyWith(color: ColorName.neutral900),
                  ),
                ),
                SizedBox(
                  height: 352.h,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) => buildModelCard(
                      index,
                      context,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding buildNavigationButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24).r,
      child: SizedBox(
        height: 56.h,
        width: context.sized.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorName.blueBase,
          ),
          onPressed: () {
            context.router.pushAndPopUntil(
              const AddDepartmentRoute(),
              predicate: (route) => false,
            );
          },
          child: AutoSizeText(
            LocaleKeys.setup_button.tr(),
            style: textTheme.titleLarge!.copyWith(color: ColorName.neutral0),
          ),
        ),
      ),
    );
  }

  Padding buildModelCard(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12).r,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedPackage = index;
          });
        },
        child: Container(
          padding: const ProjectPadding.allMedium(),
          height: 104.h,
          width: context.sized.width,
          decoration: BoxDecoration(
            color: index == selectedPackage
                ? ColorName.blueLighter
                : ColorName.neutral100,
            borderRadius: BorderRadius.circular(12).r,
            border: Border.all(
              color: index == selectedPackage
                  ? ColorName.blueBase
                  : ColorName.neutral200,
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 193.w,
                    child: AutoSizeText(
                      'Departman -Bölüm Bazlı',
                      style: textTheme.titleLarge!.copyWith(
                        color: ColorName.neutral900,
                      ),
                    ),
                  ),
                  if (index == 0)
                    buildOnerilenChip()
                  else
                    SizedBox(
                      width: 72.w,
                    ),
                  buildRadio(index),
                ],
              ),
              buildCardText(),
            ],
          ),
        ),
      ),
    );
  }

  Radio<int> buildRadio(int index) {
    return Radio(
      value: index,
      groupValue: selectedPackage,
      onChanged: (value) {
        setState(() {
          selectedPackage = value ?? 0;
        });
      },
    );
  }

  Expanded buildCardText() {
    return Expanded(
      child: AutoSizeText(
        'Personellerin, bir departman ve bölüme bağlı olarak shiftleri belirlenir. Otel ve restoran tarzı iletmeler için uygundur.',
        style: textTheme.titleSmall!.copyWith(color: ColorName.neutral400),
      ),
    );
  }

  Container buildOnerilenChip() {
    return Container(
      decoration: BoxDecoration(
        color: ColorName.blueLight,
        borderRadius: ProjectBorderRadius.allCircleNormal(),
      ),
      width: 72.w,
      height: 16.h,
      child: Center(
        child: AutoSizeText(
          'Önerilen',
          style: textTheme.titleSmall!.copyWith(
            fontSize: 11,
            color: ColorName.neutral900,
          ),
        ),
      ),
    );
  }

  SolidBottomSheet buildBottomSheet(BuildContext context) {
    return SolidBottomSheet(
      draggableBody: true,
      maxHeight: context.sized.height * (8 / 10),
      controller: solidController,
      headerBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
      body: Container(
        height: context.sized.height * (8 / 10),
        decoration: const BoxDecoration(
          color: ColorName.neutral0,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            buildBottomSheetAppBar(),
            buildSearch(),
            buildListView(),
            buildButton(context),
          ],
        ),
      ),
    );
  }

  Padding buildSearch() {
    return Padding(
      padding: const ProjectPadding.allMedium().copyWith(top: 12, bottom: 12).r,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ).r,
            child: Assets.icons.icSearch.toGetSvg(),
          ),
          hintText: LocaleKeys.setup_company_info_search.tr(),
          border: OutlineInputBorder(
            borderRadius: ProjectBorderRadius.allCircleNormal(),
          ),
        ),
      ),
    );
  }

  Flexible buildButton(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 56,
        width: context.sized.width - 40.w,
        child: ElevatedButton(
          onPressed: () {},
          child: AutoSizeText(
            LocaleKeys.setup_company_info_sheet_button.tr(),
            style: textTheme.titleLarge!.copyWith(color: ColorName.neutral0),
          ),
        ),
      ),
    );
  }

  Flexible buildListView() {
    return Flexible(
      flex: 7,
      child: ListView.separated(
        itemBuilder: (context, index) => RadioListTile(
          title: AutoSizeText(LocaleKeys.setup_company_info_sheet_title.tr()),
          value: index,
          groupValue: radioGroupValue,
          onChanged: (value) {
            radioGroupValue = value ?? 0;
          },
        ),
        separatorBuilder: (context, index) => const Divider(
          color: ColorName.neutral200,
        ),
        itemCount: 10,
      ),
    );
  }

  Padding buildBottomSheetAppBar() {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: SizedBox(
        height: 72.h,
        width: context.sized.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => solidController.hide(),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorName.neutral200,
                  ),
                  height: 32.h,
                  width: 32.w,
                  padding: const ProjectPadding.allSmall(),
                  child: Assets.icons.icClose.toGetSvg(),
                ),
              ),
            ),
            Align(
              child: AutoSizeText(
                'Sektör Seç',
                style: textTheme.bodyLarge,
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Divider(
                color: ColorName.neutral200,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildSectorInfoBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16).r,
      child: Container(
        width: context.sized.width,
        height: 48,
        clipBehavior: Clip.antiAlias,
        padding: const ProjectPadding.allSmall(),
        decoration: BoxDecoration(
          borderRadius: ProjectBorderRadius.allCircleMedium(),
          color: ColorName.neutral200,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Assets.icons.icInformationFill.toGetSvgWithColor(
                color: ColorName.neutral300,
                height: 16.h,
                width: 16.w,
              ),
            ),
            Expanded(
              child: Text(
                LocaleKeys.setup_company_info_sector_info.tr(),
                maxLines: 2,
                style: textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildSectorContainer() {
    return Padding(
      padding: const ProjectPadding.symmetricSmallV(),
      child: GestureDetector(
        onTap: () {
          solidController.isOpened
              ? solidController.hide()
              : solidController.show();
        },
        child: Container(
          height: 40.h,
          padding: const ProjectPadding.textFormFieldPadding(),
          width: context.sized.width,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: ColorName.neutral300),
            borderRadius: ProjectBorderRadius.allCircleSmall().r,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                LocaleKeys.setup_company_info_sector.tr(),
                style: textTheme.titleMedium!
                    .copyWith(color: ColorName.neutral500),
              ),
              Assets.icons.icDownArrow.toGetSvg(),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildCompanyNameTextFormField() {
    return Padding(
      padding: const ProjectPadding.symmetricSmallV(),
      child: SizedBox(
        height: 48.h,
        child: TextFormField(
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: ProjectBorderRadius.allCircleMedium().r,
            ),
            hintText: LocaleKeys.setup_company_info_company_name.tr(),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Container(
        height: 40.h,
        width: 40.w,
        padding: const ProjectPadding.allXSmall(),
        child: Assets.icons.icLogoDark.toGetSvg(),
      ),
      actions: [
        Padding(
          padding: const ProjectPadding.scaffold(),
          child: Container(
            decoration: BoxDecoration(
              color: ColorName.neutral100.withOpacity(0.7),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(6),
            height: 30.h,
            width: 30.w,
            child: Assets.icons.icClose
                .toGetSvgWithColor(color: ColorName.blueBase),
          ),
        ),
      ],
    );
  }
}
