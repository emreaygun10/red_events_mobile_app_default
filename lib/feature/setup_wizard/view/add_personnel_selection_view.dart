import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/mixin/add_personnel_selection_mixin.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/linearprogress_enums.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_personnel_top_stack.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class AddPersonnelSelectionView extends StatefulWidget {
  const AddPersonnelSelectionView({super.key});

  @override
  State<AddPersonnelSelectionView> createState() =>
      _AddPersonnelSelectionViewState();
}

class _AddPersonnelSelectionViewState
    extends BaseState<AddPersonnelSelectionView>
    with AddPersonnelSelectionMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(),
      body: Column(
        children: [
          Flexible(
            flex: 8,
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                const CustomPersonnelTopStack(
                  linearProgressEnum: LinearProgressEnum.levelFiveInFive,
                  text: LocaleKeys.setup_personnel_title,
                  maxLevel: '5',
                ),
                buildDepartmentCard(
                  context: context,
                  index: 1,
                  title: LocaleKeys.setup_personnel_manuel,
                  subTitle:
                      'Lorem sdjlfhsdjlghsd sjldhglhsdjg hsjdgjhsd kjhghksdhg',
                ),
                buildDepartmentCard(
                  context: context,
                  index: 2,
                  title: LocaleKeys.setup_personnel_link,
                  subTitle:
                      'Lorem sdjlfhsdjlghsd sjldhglhsdjg hsjdgjhsd kjhghksdhg',
                ),
              ],
            ),
          ),
          Flexible(
            child: Padding(
              padding: const ProjectPadding.scaffold(),
              child: SizedBox(
                height: 56.h,
                width: context.sized.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorName.blueBase,
                  ),
                  onPressed: () async {
                    context.router.push(groupValue == 1
                        ? const AddPersonnelListRoute()
                        : const AddPersonnelSelectionRoute());
                  },
                  child: AutoSizeText(
                    'Devam Et',
                    style: textTheme.titleLarge!.copyWith(
                      color: ColorName.neutral0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
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

  Padding buildDepartmentCard({
    required BuildContext context,
    required int index,
    required String title,
    required String subTitle,
  }) {
    return Padding(
      padding: const ProjectPadding.scaffold().copyWith(bottom: 13).r,
      child: GestureDetector(
        onTap: () {
          setState(() {
            groupValue = index;
          });
        },
        child: Container(
          padding: const ProjectPadding.allMedium(),
          height: 112.h,
          width: context.sized.width,
          decoration: BoxDecoration(
            border: Border.all(color: ColorName.neutral200, width: 2),
            borderRadius: ProjectBorderRadius.allCircleMedium(),
            color: groupValue == index
                ? ColorName.blueLighter
                : ColorName.neutral100,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10).r,
                height: 40.h,
                width: 40.w,
                decoration: const BoxDecoration(
                  color: ColorName.blueLight,
                  shape: BoxShape.circle,
                ),
                child: Assets.icons.icBuilding.toGetSvg(),
              ),
              Padding(
                padding: const ProjectPadding.symmetricMediumH(),
                child: SizedBox(
                  width: 197.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AutoSizeText(
                        title.tr(),
                        style: textTheme.titleLarge!.copyWith(
                          color: ColorName.neutral900,
                        ),
                      ),
                      AutoSizeText(
                        subTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.titleSmall!.copyWith(
                          color: ColorName.neutral400,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Radio<int>(
                value: index,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = index;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
