import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_profile_header.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_request_card.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_show_modal_bottom_sheet.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/empty_list_card.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/cubit/profile_request_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/mixin/profile_request_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/state/profil_request_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/education_chip_enum.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class ProfileRequestView extends StatefulWidget {
  const ProfileRequestView({super.key});

  @override
  State<ProfileRequestView> createState() => _ProfileRequestViewState();
}

class _ProfileRequestViewState extends BaseState<ProfileRequestView>
    with ProfileRequestMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          showModalBottomSheet<Widget>(
            isScrollControlled: true,
            context: context,
            showDragHandle: true,
            builder: (BuildContext context) {
              return const Wrap(
                children: [
                  CustomShowModalBottomSheet(),
                ],
              );
            },
          );
        },
        child: Container(
          height: 60.h,
          width: 60.w,
          padding: const ProjectPadding.allMedium(),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorName.blueBase,
          ),
          child: const Icon(
            Icons.add,
            color: ColorName.neutral0,
          ),
        ),
      ),
      appBar: buildAppBar(context),
      body: BlocProvider(
        create: (context) => profileRequestBloc,
        child: Column(
          children: [
            CustomProfileHeader(
              columnList: [
                const SizedBox(
                  height: 16,
                ),
                buildTitleText(),
                buildChipList(),
              ],
            ),
            buildMainPage(),
          ],
        ),
      ),
    );
  }

  BlocBuilder<ProfileRequestBloc, ProfileRequestState> buildMainPage() {
    return BlocBuilder<ProfileRequestBloc, ProfileRequestState>(
      builder: (context, state) {
        return selectText(state.chipIndex) != null
            ? Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  buildDescriptiveTopCard(),
                  CustomRequestCard(
                    icon: Assets.icons.icUserShared
                        .toGetSvgWithColor(color: ColorName.orangeBase),
                    date: '13/04/2023',
                    description: 'Hello desc',
                    explanation: 'bu nedenlerden dolayı',
                    request: 'Ayrılma talebi',
                  ),
                ],
              )
            : EmptyListWarning(
                icon: Assets.icons.icRequestEmpytList.toGetSvg(),
                textTheme: textTheme,
                chipText: LocaleKeys.profile_requests_empy_list.tr(
                  args: [
                    RequestChips.values[state.chipIndex].value.tr(),
                  ],
                ),
              );
      },
    );
  }

  Card buildDescriptiveTopCard() {
    return Card(
      child: Container(
        height: 125.h,
        width: 335.w,
        padding: const ProjectPadding.allNormal(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20).r,
          color: ColorName.neutral0,
        ),
        child: BlocBuilder<ProfileRequestBloc, ProfileRequestState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  LocaleKeys.profile_requests_sum.tr(),
                  style: textTheme.bodyMedium!
                      .copyWith(color: ColorName.neutral300),
                ),
                Padding(
                  padding: const ProjectPadding.symmetricXSmallV(),
                  child: AutoSizeText(
                    LocaleKeys.profile_requests_piece.tr(
                      args: [selectText(state.chipIndex).toString()],
                    ),
                    style: textTheme.headlineLarge,
                  ),
                ),
                AutoSizeText(
                  LocaleKeys.profile_requests_have_request.tr(
                    args: [
                      RequestChips.values[state.chipIndex].value.tr(),
                    ],
                  ),
                ),
              ],
            );
          },
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

  Padding buildTitleText() {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: AutoSizeText(
        LocaleKeys.profile_requests_title.tr(),
        style: textTheme.headlineMedium!.copyWith(
          color: ColorName.neutral900,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding buildChipList() {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: SizedBox(
        height: 56.h,
        child: BlocBuilder<ProfileRequestBloc, ProfileRequestState>(
          builder: (context, state) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: RequestChips.values.length,
              itemBuilder: (BuildContext context, int index) {
                return buildChip(index, state);
              },
            );
          },
        ),
      ),
    );
  }

  Padding buildChip(int index, ProfileRequestState state) {
    return Padding(
      padding: const ProjectPadding.symmetricXSmallH(),
      child: GestureDetector(
        onTap: () {
          profileRequestBloc.changeChipIndex(index);
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
                RequestChips.values[index].value.tr(),
              ),
              if (selectText(index) != null)
                Padding(
                  padding: const EdgeInsets.only(left: 5).r,
                  child: Badge.count(
                    count: selectText(index) ?? 0,
                    backgroundColor: selectChipBackgroundColor(index),
                    alignment: Alignment.center,
                    smallSize: 18,
                    largeSize: 20,
                    textColor: ColorName.neutral0,
                    textStyle: const TextStyle(fontSize: 11),
                  ),
                )
              else
                const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
