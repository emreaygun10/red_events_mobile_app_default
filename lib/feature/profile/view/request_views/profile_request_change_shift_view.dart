import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/cubit/profile_request_change_shift_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/mixins/profile_request_change_shift_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/state/profile_request_change_shift_state.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_autosizetext_for_title.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_multiline_textformfield.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_show_manager_bottom_sheet.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class ProfileRequestChangeShiftView extends StatefulWidget {
  const ProfileRequestChangeShiftView({super.key});

  @override
  State<ProfileRequestChangeShiftView> createState() =>
      _ProfileRequestChangeShiftViewState();
}

class _ProfileRequestChangeShiftViewState
    extends BaseState<ProfileRequestChangeShiftView>
    with ProfileRequestChangeShiftMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileRequestChangeShiftBloc,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Padding(
          padding: const ProjectPadding.scaffold(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const ProjectPadding.symmetricLargeV().copyWith(bottom: 0),
                child: const CustomAutoSizeTextForTitle(
                  text: LocaleKeys.profile_change_shift_manager_selection,
                ),
              ),
              buildCustomManagerTextFormFieldList(),
              warningMaxManagerRow(),
              Padding(
                padding:
                    const ProjectPadding.symmetricLargeV().copyWith(bottom: 0),
                child: const CustomAutoSizeTextForTitle(
                  text: LocaleKeys.profile_change_shift_day_selection,
                ),
              ),
              buildCustomDayTextFormFieldList(),
              Padding(
                padding:
                    const ProjectPadding.symmetricLargeV().copyWith(bottom: 0),
                child: const CustomAutoSizeTextForTitle(
                  text: LocaleKeys
                      .profile_requests_request_permission_explanation,
                ),
              ),
              Padding(
                padding: const ProjectPadding.symmetricSmallV(),
                child: CustomMultilineTextFormField(
                  valueChanged:
                      profileRequestChangeShiftBloc.valueChangedExplanation,
                  controller: textEditingControllerExplanation,
                ),
              ),
              const Spacer(
                flex: 9,
              ),
              SizedBox(
                height: 56.h,
                width: context.sized.width,
                child: BlocConsumer<ProfileRequestChangeShiftBloc,
                    ProfileRequestChangeShiftState>(
                  listener: (context, state) {
                    if (state.managerCheckBoxList.isNotEmpty &&
                        state.explanation.ext.isNotNullOrNoEmpty &&
                        state.dayCheckBoxList.isNotEmpty) {
                      profileRequestChangeShiftBloc.changeButtonEnable(
                        isEnable: true,
                      );
                    } else {
                      profileRequestChangeShiftBloc.changeButtonEnable(
                        isEnable: false,
                      );
                    }
                  },
                  builder: (BuildContext context, state) {
                    return ElevatedButton(
                      onPressed: () async {
                        if (state.isButtonEnable) {
                          await buildShowBottomSheetRequest(context);
                          await context.router
                              .push(const BottomNAvigationBarRoute());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: state.isButtonEnable
                            ? ColorName.blueBase
                            : ColorName.neutral200,
                      ),
                      child: AutoSizeText(
                        LocaleKeys.profile_progress_payment_chips_button.tr(),
                        style: textTheme.titleLarge!.copyWith(
                          color: state.isButtonEnable
                              ? ColorName.neutral0
                              : ColorName.neutral400,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 72.h,
      leadingWidth: 80.w,
      titleSpacing: 0,
      surfaceTintColor: ColorName.neutral0,
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
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            LocaleKeys.profile_requests_request_type_title.tr(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          AutoSizeText(
            LocaleKeys.profile_requests_request_type_payroll_request.tr(),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: ColorName.neutral400),
          ),
        ],
      ),
    );
  }

  Row warningMaxManagerRow() {
    return Row(
      children: [
        Assets.icons.icErrorWarningFill.toGetSvg(),
        AutoSizeText(
          LocaleKeys.profile_progress_payment_chips_max_manager.tr(),
          style: textTheme.titleMedium!.copyWith(color: ColorName.neutral400),
        ),
      ],
    );
  }

  BlocBuilder<ProfileRequestChangeShiftBloc, ProfileRequestChangeShiftState>
      buildCustomManagerTextFormFieldList() {
    return BlocBuilder<ProfileRequestChangeShiftBloc,
        ProfileRequestChangeShiftState>(
      builder: (context, state) {
        return Padding(
          padding: const ProjectPadding.symmetricSmallV(),
          child: SizedBox(
            height: 40.h,
            child: TextFormField(
              showCursor: false,
              keyboardType: TextInputType.none,
              controller: textEditingControllerManagerType,
              onTap: () => buildShowModalBottom(context),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: ProjectBorderRadius.allCircleMedium().r,
                ),
                suffixIcon: Padding(
                  padding: const ProjectPadding.allSmall(),
                  child: Container(
                    child: Assets.icons.icDownArrow.toGetSvg(),
                  ),
                ),
                hintText: LocaleKeys.profile_change_shift_select_hint.tr(),
              ),
            ),
          ),
        );
      },
    );
  }

  BlocBuilder<ProfileRequestChangeShiftBloc, ProfileRequestChangeShiftState>
      buildCustomDayTextFormFieldList() {
    return BlocBuilder<ProfileRequestChangeShiftBloc,
        ProfileRequestChangeShiftState>(
      builder: (context, state) {
        return Padding(
          padding: const ProjectPadding.symmetricSmallV(),
          child: SizedBox(
            height: 40.h,
            child: TextFormField(
              showCursor: false,
              keyboardType: TextInputType.none,
              controller: textEditingControllerDayType,
              onTap: () async {
                // dayBottomSheetOpenOrHide();
                await buildDayShowModalBottom(context);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: ProjectBorderRadius.allCircleMedium().r,
                ),
                suffixIcon: Padding(
                  padding: const ProjectPadding.allSmall(),
                  child: Container(
                    child: Assets.icons.icDownArrow.toGetSvg(),
                  ),
                ),
                hintText: LocaleKeys.profile_change_shift_select_hint.tr(),
              ),
            ),
          ),
        );
      },
    );
  }

  void buildShowModalBottom(BuildContext context) {
    // return SolidBottomSheet(
    //   controller: solidManagerController,
    //   headerBar: const SizedBox(),
    //   body: BlocProvider(
    //     create: (context) => profileRequestChangeShiftBloc,
    //     child: BlocBuilder<ProfileRequestChangeShiftBloc,
    //         ProfileRequestChangeShiftState>(
    //       builder: (context, state) {
    //         return SizedBox(
    //           height: state.managerBottomHeight,
    //           width: context.sized.width,
    //           child: Padding(
    //             padding: const ProjectPadding.scaffold(),
    //             child: Column(
    //               children: [
    //                 AutoSizeText(
    //                   LocaleKeys
    //                       .profile_progress_payment_chips_manager_selection
    //                       .tr(),
    //                   style: textTheme.headlineMedium,
    //                 ),
    //                 AutoSizeText(
    //                   LocaleKeys.profile_progress_payment_chips_max_manager
    //                       .tr(),
    //                   style: textTheme.labelSmall!
    //                       .copyWith(color: ColorName.neutral500),
    //                 ),
    //                 Expanded(
    //                   child: ListView.separated(
    //                     itemBuilder: (context, index) {
    //                       return ListTile(
    //                         title: AutoSizeText(
    //                           state.managerList[index],
    //                         ),
    //                         leading: BlocConsumer<ProfileRequestChangeShiftBloc,
    //                             ProfileRequestChangeShiftState>(
    //                           listener: (context, state) {
    //                             textEditingControllerManagerType.text =
    //                                 textBoxString ?? '';
    //                           },
    //                           builder: (context, state) {
    //                             return Checkbox(
    //                               value: state.managerCheckBoxList.contains(
    //                                 state.managerList[index],
    //                               ),
    //                               onChanged: (value) {
    //                                 if (value ?? false) {
    //                                   addManager(
    //                                     state.managerList[index],
    //                                   );
    //                                 } else {
    //                                   removeManager(
    //                                     state.managerList[index],
    //                                   );
    //                                 }
    //                               },
    //                             );
    //                           },
    //                         ),
    //                       );
    //                     },
    //                     separatorBuilder: (context, index) {
    //                       return const Divider(
    //                         color: ColorName.neutral200,
    //                         height: 2,
    //                       );
    //                     },
    //                     itemCount: state.managerList.length,
    //                   ),
    //                 ),
    //                 buildContinueButtonBottomSheet(context),
    //               ],
    //             ),
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );
    showModalBottomSheet<void>(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      showDragHandle: true,
      enableDrag: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setstate) {
            return SizedBox(
              height: context.sized.height * 0.45,
              width: context.sized.width,
              child: Padding(
                padding: const ProjectPadding.scaffold(),
                child: Column(
                  children: [
                    AutoSizeText(
                      LocaleKeys
                          .profile_progress_payment_chips_manager_selection
                          .tr(),
                      style: textTheme.headlineMedium,
                    ),
                    AutoSizeText(
                      LocaleKeys.profile_progress_payment_chips_max_manager
                          .tr(),
                      style: textTheme.labelSmall!
                          .copyWith(color: ColorName.neutral500),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: AutoSizeText(
                              profileRequestChangeShiftBloc
                                  .state.managerList[index],
                            ),
                            leading: Checkbox(
                              value: profileRequestChangeShiftBloc
                                  .state.managerCheckBoxList
                                  .contains(
                                profileRequestChangeShiftBloc
                                    .state.managerList[index],
                              ),
                              onChanged: (value) {
                                if (value ?? false) {
                                  addManager(
                                    profileRequestChangeShiftBloc
                                        .state.managerList[index],
                                  );
                                  setstate() {}
                                } else {
                                  removeManager(
                                    profileRequestChangeShiftBloc
                                        .state.managerList[index],
                                  );
                                  setstate() {}
                                }
                              },
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: ColorName.neutral200,
                            height: 2,
                          );
                        },
                        itemCount: profileRequestChangeShiftBloc
                            .state.managerList.length,
                      ),
                    ),
                    buildContinueButtonBottomSheet(context),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<Widget?> buildDayShowModalBottom(BuildContext buildContext) {
    // return SolidBottomSheet(
    //   controller: solidDayController,
    //   headerBar: const SizedBox(),
    //   body: BlocProvider(
    //     create: (buildContext) => profileRequestChangeShiftBloc,
    //     child: SizedBox(
    //       height: buildContext.sized.height * 0.45,
    //       width: buildContext.sized.width,
    //       child: Padding(
    //         padding: const ProjectPadding.scaffold(),
    //         child: Column(
    //           children: [
    //             AutoSizeText(
    //               LocaleKeys.profile_change_shift_day_selection.tr(),
    //               style: textTheme.headlineMedium,
    //             ),
    //             BlocBuilder<ProfileRequestChangeShiftBloc,
    //                 ProfileRequestChangeShiftState>(
    //               builder: (context, state) {
    //                 return Expanded(
    //                   child: ListView.separated(
    //                     itemBuilder: (context, index) {
    //                       return ListTile(
    //                         title: AutoSizeText(
    //                           state.dayList[index],
    //                         ),
    //                         subtitle: AutoSizeText(
    //                           'Manzara Restaurant',
    //                           style: textTheme.titleSmall!.copyWith(
    //                             color: ColorName.neutral400,
    //                           ),
    //                         ),
    //                         leading: BlocConsumer<ProfileRequestChangeShiftBloc,
    //                             ProfileRequestChangeShiftState>(
    //                           listener: (buildContext, state) {
    //                             textEditingControllerDayType.text =
    //                                 textDayBoxString ?? '';
    //                           },
    //                           builder: (buildContext, state) {
    //                             return Checkbox(
    //                               value: state.dayCheckBoxList.contains(
    //                                 state.dayList[index],
    //                               ),
    //                               onChanged: (value) {
    //                                 if (value ?? false) {
    //                                   addDays(
    //                                     state.dayList[index],
    //                                   );
    //                                 } else {
    //                                   removeDays(
    //                                     state.dayList[index],
    //                                   );
    //                                 }
    //                               },
    //                             );
    //                           },
    //                         ),
    //                       );
    //                     },
    //                     separatorBuilder: (buildContext, index) {
    //                       return const Divider(
    //                         color: ColorName.neutral200,
    //                         height: 2,
    //                       );
    //                     },
    //                     itemCount: state.dayList.length,
    //                   ),
    //                 );
    //               },
    //             ),
    //             buildContinueButtonBottomSheet(buildContext),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    return showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      showDragHandle: true,
      enableDrag: false,
      builder: (context) {
        return BlocProvider(
          create: (context) => profileRequestChangeShiftBloc,
          child: SizedBox(
            height: context.sized.height * 0.45,
            width: context.sized.width,
            child: Padding(
              padding: const ProjectPadding.scaffold(),
              child: Column(
                children: [
                  AutoSizeText(
                    LocaleKeys.profile_change_shift_day_selection.tr(),
                    style: textTheme.headlineMedium,
                  ),
                  BlocBuilder<ProfileRequestChangeShiftBloc,
                      ProfileRequestChangeShiftState>(
                    builder: (context, state) {
                      return Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: AutoSizeText(
                                state.dayList[index],
                              ),
                              subtitle: AutoSizeText(
                                'Manzara Restaurant',
                                style: textTheme.titleSmall!.copyWith(
                                  color: ColorName.neutral400,
                                ),
                              ),
                              leading: BlocConsumer<
                                  ProfileRequestChangeShiftBloc,
                                  ProfileRequestChangeShiftState>(
                                listener: (context, state) {
                                  textEditingControllerDayType.text =
                                      textDayBoxString ?? '';
                                },
                                builder: (context, state) {
                                  return Checkbox(
                                    value: state.dayCheckBoxList.contains(
                                      state.dayList[index],
                                    ),
                                    onChanged: (value) {
                                      if (value ?? false) {
                                        addDays(
                                          state.dayList[index],
                                        );
                                      } else {
                                        removeDays(
                                          state.dayList[index],
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              color: ColorName.neutral200,
                              height: 2,
                            );
                          },
                          itemCount: state.dayList.length,
                        ),
                      );
                    },
                  ),
                  buildContinueButtonBottomSheet(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Padding buildContinueButtonBottomSheet(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.symmetricLargeV(),
      child: SizedBox(
        height: 50.h,
        width: context.sized.width,
        child: ElevatedButton(
          onPressed: () {
            context.router.pop();
          },
          child: AutoSizeText(
            LocaleKeys.general_button_continue.tr(),
            style: textTheme.titleLarge!.copyWith(
              color: ColorName.neutral0,
            ),
          ),
        ),
      ),
    );
  }

  Future<Widget?> buildShowBottomSheetRequest(BuildContext context) {
    return showModalBottomSheet<Widget>(
      isScrollControlled: true,
      context: context,
      showDragHandle: true,
      builder: (BuildContext context) {
        return const CustomShowManagerBottomSheet();
      },
    );
  }
}
