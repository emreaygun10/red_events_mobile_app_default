import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/cubit/profile_request_payroll_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/mixins/profile_request_payroll_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/state/profile_request_payroll.state.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_autosizetext_for_title.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_multiline_textformfield.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_okay_elaviton_button.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class ProfileRequestPayrollView extends StatefulWidget {
  const ProfileRequestPayrollView({super.key});

  @override
  State<ProfileRequestPayrollView> createState() =>
      _ProfileRequestPayrollViewState();
}

class _ProfileRequestPayrollViewState
    extends BaseState<ProfileRequestPayrollView>
    with ProfileRequestPayrollMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileRequestPayrollBloc,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Padding(
          padding: const ProjectPadding.scaffold(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Spacer(),
              Padding(
                padding:
                    const ProjectPadding.symmetricLargeV().copyWith(bottom: 0),
                child: const CustomAutoSizeTextForTitle(
                  text: LocaleKeys
                      .profile_progress_payment_chips_manager_selection,
                ),
              ),
              buildCustomTextFormFieldList(),
              warningMaxManagerRow(),
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
                      profileRequestPayrollBloc.valueChangedExplanation,
                  controller: textEditingControllerExplanation,
                ),
              ),
              const Spacer(
                flex: 9,
              ),
              SizedBox(
                height: 56.h,
                width: context.sized.width,
                child: BlocConsumer<ProfileRequestPayrollBloc,
                    ProfileRequestPayrollState>(
                  listener: (context, state) {
                    print(state.explanation.ext.isNotNullOrNoEmpty);
                    if (state.checkBoxList.isNotEmpty &&
                        state.explanation.ext.isNotNullOrNoEmpty) {
                      profileRequestPayrollBloc.changeButtonEnable(
                        isEnable: true,
                      );
                    } else {
                      profileRequestPayrollBloc.changeButtonEnable(
                        isEnable: false,
                      );
                    }
                  },
                  builder: (BuildContext context, state) {
                    return ElevatedButton(
                      onPressed: () async {
                        await buildShowBottomSheetRequest();
                        await context.router
                            .push(const BottomNAvigationBarRoute());
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

  Row warningMaxManagerRow() {
    return Row(
      children: [
        const Icon(
          Icons.warning_amber_rounded,
          color: ColorName.neutral400,
        ),
        AutoSizeText(
          LocaleKeys.profile_progress_payment_chips_max_manager.tr(),
          style: textTheme.titleMedium!.copyWith(color: ColorName.neutral400),
        ),
      ],
    );
  }

  Future<Widget?> buildShowBottomSheetRequest() {
    return showModalBottomSheet<Widget>(
      isScrollControlled: true,
      context: context,
      showDragHandle: true,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            Column(
              children: [
                AutoSizeText(
                  LocaleKeys.profile_requests_request_permission_information
                      .tr(),
                ),
                const Padding(
                  padding: ProjectPadding.symmetricSmallV(),
                  child: Divider(
                    height: 2,
                    color: ColorName.neutral300,
                  ),
                ),
                SizedBox(
                  height: 250.h,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 32.h,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 88.h,
                            width: 88.w,
                            padding: const ProjectPadding.allMedium(),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorName.neutral200,
                            ),
                          ),
                          Container(
                            height: 56.h,
                            width: 56.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorName.greenBase,
                            ),
                          ),
                          Assets.icons.icCheckLine.toGetSvg(),
                        ],
                      ),
                      const Spacer(),
                      AutoSizeText(
                        LocaleKeys.profile_progress_payment_chips_info.tr(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Spacer(
                        flex: 5,
                      ),
                      const CustomOkayElevationButton(),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 72.h,
      leadingWidth: 80.w,
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

  BlocBuilder<ProfileRequestPayrollBloc, ProfileRequestPayrollState>
      buildCustomTextFormFieldList() {
    return BlocBuilder<ProfileRequestPayrollBloc, ProfileRequestPayrollState>(
      builder: (context, state) {
        return Padding(
          padding: const ProjectPadding.symmetricSmallV(),
          child: SizedBox(
            height: 40.h,
            child: TextFormField(
              showCursor: false,
              keyboardType: TextInputType.none,
              controller: textEditingControllerPayrollType,
              onTap: () async {
                await buildShowModalBottom();
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
                hintText: LocaleKeys.add_personnel_base_inform_city_hint.tr(),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<Widget?> buildShowModalBottom() {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      showDragHandle: true,
      builder: (context) {
        return BlocProvider(
          create: (context) => profileRequestPayrollBloc,
          child: SizedBox(
            height: context.sized.height * 0.45,
            width: context.sized.width,
            child: Padding(
              padding: const ProjectPadding.scaffold(),
              child: Column(
                children: [
                  AutoSizeText(
                    LocaleKeys.profile_progress_payment_chips_manager_selection
                        .tr(),
                    style: textTheme.headlineMedium,
                  ),
                  AutoSizeText(
                    LocaleKeys.profile_progress_payment_chips_max_manager.tr(),
                    style: textTheme.labelSmall!
                        .copyWith(color: ColorName.neutral500),
                  ),
                  BlocBuilder<ProfileRequestPayrollBloc,
                      ProfileRequestPayrollState>(
                    builder: (context, state) {
                      return Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: AutoSizeText(
                                state.managerList[index],
                              ),
                              leading: BlocConsumer<ProfileRequestPayrollBloc,
                                  ProfileRequestPayrollState>(
                                listener: (context, state) {
                                  textEditingControllerPayrollType.text =
                                      textBoxString ?? '';
                                },
                                builder: (context, state) {
                                  return Checkbox(
                                    value: state.checkBoxList.contains(
                                      state.managerList[index],
                                    ),
                                    onChanged: (value) {
                                      if (value ?? false) {
                                        addManager(
                                          state.managerList[index],
                                        );
                                      } else {
                                        removeManager(
                                          state.managerList[index],
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
                          itemCount: state.managerList.length,
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
}
