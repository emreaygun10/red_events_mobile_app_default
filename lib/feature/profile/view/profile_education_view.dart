import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_education_cart.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_profile_header.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/empty_list_card.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/cubit/profile_education_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/mixin/profile_education_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/state/profile_education_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/education_chip_enum.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class ProfileEducationView extends StatefulWidget {
  const ProfileEducationView({super.key});

  @override
  State<ProfileEducationView> createState() => _ProfileEducationViewState();
}

class _ProfileEducationViewState extends BaseState<ProfileEducationView>
    with ProfileEducationMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileEducationBloc,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Column(
          children: [
            CustomProfileHeader(
              columnList: [
                const SizedBox(
                  height: 16,
                ),
                buildTitleText(),
                const Spacer(),
                buildChipList(),
                const Spacer(),
              ],
            ),
            Padding(
              padding: const ProjectPadding.symmetricLargeV(),
              child: BlocBuilder<ProfileEducationBloc, ProfileEducationState>(
                builder: (context, state) {
                  return state.educationList != null
                      ? SizedBox(
                          height: 400.h,
                          child: ListView.builder(
                            itemCount: state.educationList!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return const CustomEducationCard();
                            },
                          ),
                        )
                      : EmptyListWarning(
                          icon: Assets.icons.icNullEducation
                              .svg(package: ModuleEnum.gen.value),
                          textTheme: textTheme,
                          chipText: LocaleKeys.profile_education_empy_list.tr(
                            args: [
                              EducationChips.values[state.chipIndex].value.tr(),
                            ],
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildChipList() {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: SizedBox(
        height: 32.h,
        child: BlocBuilder<ProfileEducationBloc, ProfileEducationState>(
          builder: (context, state) {
            // return ListView.builder(
            //   scrollDirection: Axis.horizontal,
            //   itemCount: EducationChips.values.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     return buildChip(index, state);
            //   },
            // );
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildChip(EducationChips.waiting.index, state),
                buildChip(EducationChips.continuos.index, state),
                buildChip(EducationChips.completed.index, state),
              ],
            );
          },
        ),
      ),
    );
  }

  Padding buildChip(int index, ProfileEducationState state) {
    return Padding(
      padding: const ProjectPadding.symmetricXSmallH(),
      child: GestureDetector(
        onTap: () {
          profileEducationBloc.changeChipIndex(index);
        },
        child: Container(
          width: 106.w,
          padding: const ProjectPadding.customChipPaddingLarge(),
          decoration: BoxDecoration(
            color: state.chipIndex == index
                ? ColorName.blueBase
                : ColorName.neutral200,
            borderRadius: ProjectBorderRadius.allCircleMedium(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: AutoSizeText(
                  EducationChips.values[index].value.tr(),
                ),
              ),
              Visibility(
                visible: selectText(index) != null,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8).r,
                  child: Badge(
                    backgroundColor: selectChipBackgroundColor(
                      index,
                    ),
                    smallSize: 16.r,
                    largeSize: 20.r,
                    textColor:
                        index != 0 ? ColorName.neutral900 : ColorName.neutral0,
                    child: AutoSizeText(
                      selectText(index).toString(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildTitleText() {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: AutoSizeText(
        LocaleKeys.profile_list_educations.tr(),
        style: textTheme.headlineMedium!.copyWith(
          color: ColorName.neutral900,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
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
