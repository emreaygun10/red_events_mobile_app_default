import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/mixin/package_selection_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/widgets/custom_bottom_button.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/widgets/custom_setup_app_bar_widget.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/package_selection_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/state/package_selection_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/linearprogress_enums.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_personnel_top_stack.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class PackageSelectionView extends StatefulWidget {
  const PackageSelectionView({super.key});

  @override
  State<PackageSelectionView> createState() => _PackageSelectionViewState();
}

class _PackageSelectionViewState extends BaseState<PackageSelectionView>
    with PackageSelectionMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => packageSelectionBloc,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomSetupAppBarWidget(),
        body: Column(
          children: [
            const CustomPersonnelTopStack(
              linearProgressEnum: LinearProgressEnum.levelOneInFive,
              text: LocaleKeys.setup_company_info_title,
              maxLevel: '5',
            ),
            Flexible(
              flex: 14,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 2,
                itemBuilder: (context, index) => Padding(
                  padding:
                      const ProjectPadding.scaffold().copyWith(bottom: 12).r,
                  child:
                      BlocBuilder<PackageSelectionBloc, PackageSelectionState>(
                    builder: (context, state) {
                      return Container(
                        padding: const ProjectPadding.allNormal()
                            .copyWith(bottom: 8, top: 8),
                        width: context.sized.width,
                        decoration: BoxDecoration(
                          color: ColorName.neutral0,
                          border: Border.all(
                            color: index == state.groupValue
                                ? ColorName.blueBase
                                : ColorName.neutral200,
                          ),
                          borderRadius: ProjectBorderRadius.allCircleNormal(),
                          boxShadow: const [
                            BoxShadow(
                              color: ColorName.neutral300,
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ExpandablePanel(
                          collapsed: buildCollapsedContainer(context, index),
                          expanded: buildExpendedContainer(context, index),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const Spacer(),
            buildButton(context),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  SizedBox buildButton(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: context.sized.width,
      child: CustomBottomButton(
        textTheme: textTheme,
        backgroundColor: ColorName.blueBase,
        textColor: ColorName.neutral0,
        route: const CompanyInformationRoute(),
        text: '1 Ay Ücretsiz Dene',
      ),
    );
  }

  Column buildCollapsedContainer(BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildRadio(index),
        buildSecondRow(),
        buildSegmentRow(),
        buildBottomButton(false),
      ],
    );
  }

  Padding buildSegmentRow() {
    return Padding(
      padding: const ProjectPadding.symmetricMediumV(),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: ColorName.neutral100,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            height: 36.h,
            child: SegmentControlWidget<bool>(
              childeren: const {
                true: AutoSizeText(
                  '100 kişi + 3 Yönetici',
                ),
                false: AutoSizeText(
                  '250 kişi + 8 Yönetici',
                ),
              },
              initiaValue: true,
              onChange: print,
              width: 144.w,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          AutoSizeText(
            'Küçük ölçekli işletmeler için temel insan kaynakları yönetimi modüllerini içerir. ',
            style: textTheme.titleMedium!.copyWith(color: ColorName.neutral500),
          ),
        ],
      ),
    );
  }

  BlocBuilder<PackageSelectionBloc, PackageSelectionState> buildRadio(
    int index,
  ) {
    return BlocBuilder<PackageSelectionBloc, PackageSelectionState>(
      builder: (context, state) {
        return Radio(
          value: index,
          groupValue: state.groupValue,
          onChanged: (value) {
            packageSelectionBloc.changeRadio(value ?? 0);
          },
          fillColor: MaterialStateColor.resolveWith(
            (states) => index == state.groupValue
                ? ColorName.blueBase
                : ColorName.neutral300,
          ),
          activeColor: ColorName.blueBase,
        );
      },
    );
  }

  Column buildExpendedContainer(BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildRadio(index),
        buildSecondRow(),
        buildSegmentRow(),
        buildExpendedCustomContainer(context),
        buildBottomButton(true),
      ],
    );
  }

  SizedBox buildExpendedCustomContainer(BuildContext context) {
    return SizedBox(
      height: 263,
      width: context.sized.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: ProjectPadding.scaffold(),
            child: Divider(
              height: 2,
              color: ColorName.neutral200,
            ),
          ),
          AutoSizeText(
            LocaleKeys.setup_package_selection_add_title.tr(),
            style: textTheme.titleSmall!.copyWith(color: ColorName.neutral400),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  height: 40,
                  width: context.sized.width,
                  padding: const ProjectPadding.allSmall(),
                  child: Row(
                    children: [
                      Assets.icons.icUser2.toGetSvgWithColor(
                        color: ColorName.neutral900,
                        height: 35.h,
                        width: 35.w,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      AutoSizeText(
                        'IK Yönetimi',
                        style: textTheme.titleSmall!.copyWith(
                          color: ColorName.neutral900,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Column buildBottomButton(bool iconUp) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: ProjectPadding.scaffold(),
          child: Divider(
            height: 2,
            color: ColorName.neutral200,
          ),
        ),
        Row(
          children: [
            AutoSizeText(LocaleKeys.setup_package_selection_all_property.tr()),
            SizedBox(
              width: 8.w,
            ),
            ExpandableButton(
              child: iconUp
                  ? Assets.icons.icArrowUpLine.toGetSvg()
                  : Assets.icons.icDownArrow.toGetSvg(),
            ),
          ],
        ),
      ],
    );
  }

  Row buildSecondRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 36.h,
          width: 92.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorName.blueBase,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.icons.star.toGetSvg(),
              SizedBox(
                width: 8.w,
              ),
              AutoSizeText(
                'Light',
                style: textTheme.labelLarge!.copyWith(
                  color: ColorName.neutral0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '£',
                style: textTheme.headlineMedium,
              ),
              TextSpan(
                text: '59',
                style: textTheme.headlineMedium,
              ),
              buildSoftTextSpan(
                ' .99',
              ),
              buildSoftTextSpan(
                LocaleKeys.setup_package_selection_mounth,
              ),
            ],
          ),
        ),
      ],
    );
  }

  TextSpan buildSoftTextSpan(String text) {
    return TextSpan(
      text: text.tr(),
      style: textTheme.headlineMedium!.copyWith(
        color: ColorName.neutral400,
      ),
    );
  }
}
