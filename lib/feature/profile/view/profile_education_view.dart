import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_education_cart.dart';
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
            Container(
              height: 104.h,
              width: context.sized.width,
              color: ColorName.neutral0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  buildTitleText(),
                  buildChipList(),
                ],
              ),
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
                      : buildListEmptyWarningWidget(state);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildListEmptyWarningWidget(ProfileEducationState state) {
    return Container(
      height: 401.h,
      color: ColorName.neutral0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.icNullEducation.svg(package: ModuleEnum.gen.value),
            Padding(
              padding: const ProjectPadding.symmetricNormalV(),
              child: SizedBox(
                width: 182.w,
                child: AutoSizeText(
                  LocaleKeys.profile_education_empy_list.tr(
                    args: [
                      EducationChips.values[state.chipIndex].value.tr(),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: textTheme.labelMedium,
                ),
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
        height: 56.h,
        child: BlocBuilder<ProfileEducationBloc, ProfileEducationState>(
          builder: (context, state) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: EducationChips.values.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const ProjectPadding.symmetricXSmallH(),
                  child: GestureDetector(
                    onTap: () {
                      profileEducationBloc.changeChipIndex(index);
                    },
                    child: Chip(
                      padding: const ProjectPadding.customChipPaddingLarge(),
                      shape: const StadiumBorder(),
                      side: BorderSide.none,
                      backgroundColor: state.chipIndex == index
                          ? ColorName.blueBase
                          : ColorName.neutral200,
                      label: Row(
                        children: [
                          AutoSizeText(
                            EducationChips.values[index].value.tr(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8).r,
                            child: selectText(index) != null
                                ? Badge(
                                    backgroundColor: selectChipBackgroundColor(
                                      index,
                                    ),
                                    smallSize: 16.r,
                                    largeSize: 20.r,
                                    textColor: index != 0
                                        ? ColorName.neutral900
                                        : ColorName.neutral0,
                                    child: AutoSizeText(
                                      selectText(index).toString(),
                                    ),
                                  )
                                : const SizedBox(),
                          ),
                        ],
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
      backgroundColor: ColorName.neutral0,
      leading: GestureDetector(
        onTap: () async {
          await context.router.pop();
        },
        child: Padding(
          padding: const ProjectPadding.allSmall(),
          child: SizedBox(
            height: 24.h,
            width: 24.w,
            child: Container(
              decoration: const BoxDecoration(
                color: ColorName.neutral200,
                shape: BoxShape.circle,
              ),
              child: Assets.icons.icArroeLeftS.svg(
                package: ModuleEnum.gen.value,
                color: ColorName.neutral900,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
