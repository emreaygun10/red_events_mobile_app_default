import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_profile_cell.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_profile_header.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/cubit/profile_performance_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/mixin/profile_perfomance_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/state/profile_performance_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class ProfilePerformanceView extends StatefulWidget {
  const ProfilePerformanceView({super.key});

  @override
  State<ProfilePerformanceView> createState() => _ProfilePerformanceViewState();
}

class _ProfilePerformanceViewState extends BaseState<ProfilePerformanceView>
    with ProfilePerfomanceMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BlocProvider(
        create: (context) => profilePerformanceBloc,
        child: Column(
          children: [
            CustomProfileHeader(
              columnList: [
                SizedBox(
                  height: 16.h,
                ),
                buildTitleText(),
                buildListViewChip(),
              ],
            ),
            buildPerformanceCard(),
          ],
        ),
      ),
    );
  }

  Padding buildPerformanceCard() {
    return Padding(
      padding: const ProjectPadding.scaffold().copyWith(top: 30),
      child: Container(
        padding: const ProjectPadding.scaffold().copyWith(top: 20).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorName.neutral0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AutoSizeText(
                  '4.2',
                  style: textTheme.headlineLarge,
                ),
                Padding(
                  padding: const ProjectPadding.symmetricSmallV(),
                  child: Assets.icons.icStarFill.svg(
                    package: ModuleEnum.gen.value,
                    height: 24,
                    width: 24,
                  ),
                ),
              ],
            ),
            AutoSizeText(
              LocaleKeys.profile_performance_total_point.tr(),
            ),
            const Padding(
              padding: ProjectPadding.symmetricMediumV(),
              child: Divider(
                color: ColorName.neutral300,
                height: 2,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorName.neutral100,
                borderRadius: BorderRadius.circular(10).r,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomPerformanceCell(
                    widget: AutoSizeText(
                      LocaleKeys.profile_performance_criteria.tr(),
                      style: textTheme.bodySmall,
                    ),
                  ),
                  CustomPerformanceCell(
                    widget: AutoSizeText(
                      LocaleKeys.profile_performance_point.tr(),
                      style: textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    CustomPerformanceCell(
                      widget: AutoSizeText(
                        LocaleKeys.profile_performance_manager_point.tr(),
                        style: textTheme.labelSmall,
                      ),
                    ),
                    CustomPerformanceCell(
                      widget: AutoSizeText(
                        LocaleKeys.profile_performance_latest_shift.tr(),
                        style: textTheme.labelSmall,
                      ),
                    ),
                    CustomPerformanceCell(
                      widget: AutoSizeText(
                        LocaleKeys.profile_performance_debit.tr(),
                        style: textTheme.labelSmall,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CustomPerformanceCell(
                      widget: AutoSizeText(
                        LocaleKeys.profile_performance_manager_point.tr(),
                      ),
                    ),
                    CustomPerformanceCell(
                      widget: AutoSizeText(
                        LocaleKeys.profile_performance_latest_shift.tr(),
                      ),
                    ),
                    CustomPerformanceCell(
                      widget: AutoSizeText(
                        LocaleKeys.profile_performance_debit.tr(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding buildListViewChip() {
    return Padding(
      padding: const ProjectPadding.scaffold().copyWith(top: 8).r,
      child: SizedBox(
        height: 32.h,
        width: context.sized.width,
        child: BlocBuilder<ProfilePerformanceBloc, ProfilePerformanceState>(
          builder: (context, state) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const ProjectPadding.symmetricXSmallH(),
                  child: GestureDetector(
                    onTap: () => profilePerformanceBloc.changeChipIndex(index),
                    child: Container(
                      padding: const ProjectPadding.customChipPaddingLarge(),
                      decoration: BoxDecoration(
                        borderRadius: ProjectBorderRadius.allCircleMedium(),
                        color: state.chipIndex == index
                            ? ColorName.blueBase
                            : ColorName.neutral200,
                      ),
                      child: AutoSizeText(
                        (currentYear - index).toString(),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Padding buildTitleText() {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: AutoSizeText(
        LocaleKeys.profile_list_performance.tr(),
        style: textTheme.headlineMedium!.copyWith(
          color: ColorName.neutral900,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: ColorName.neutral0,
      leadingWidth: 80.w,
      leading: Padding(
        padding: const ProjectPadding.scaffold(),
        child: GestureDetector(
          onTap: () => context.router.pop(),
          child: Container(
            height: 24.h,
            width: 24.w,
            padding: const ProjectPadding.allSmall(),
            decoration: const BoxDecoration(
              color: ColorName.neutral200,
              shape: BoxShape.circle,
            ),
            child: Assets.icons.icArroeLeftS.toGetSvg(),
          ),
        ),
      ),
    );
  }
}
