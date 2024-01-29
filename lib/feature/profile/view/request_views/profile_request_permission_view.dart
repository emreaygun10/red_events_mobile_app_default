import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/cubit/profile_request_permission_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/mixins/profile_request_permission_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/state/profile_request_permission_state.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_autosizetext_for_title.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_multiline_textformfield.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_show_manager_bottom_sheet.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_divider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
final class ProfileRequestPermissionView extends StatefulWidget {
  const ProfileRequestPermissionView({super.key});

  @override
  State<ProfileRequestPermissionView> createState() =>
      _ProfileRequestPermissionViewState();
}

class _ProfileRequestPermissionViewState
    extends BaseState<ProfileRequestPermissionView>
    with ProfileRequestPermissionMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileRequestPermissionBloc,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Padding(
          padding: const ProjectPadding.scaffold(),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    padding: const ProjectPadding.onlyTopXLarge(),
                    children: [
                      const CustomAutoSizeTextForTitle(
                        text: LocaleKeys
                            .profile_requests_detail_page_permission_type,
                      ),
                      Padding(
                        padding: const ProjectPadding.symmetricSmallV(),
                        child: SizedBox(
                          height: 40.h,
                          child: TextFormField(
                            showCursor: false,
                            keyboardType: TextInputType.none,
                            onTap: () {
                              profileRequestPermissionBloc
                                  .selectPermissionType(2);
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    ProjectBorderRadius.allCircleMedium().r,
                              ),
                              suffixIcon: Padding(
                                padding: const ProjectPadding.allSmall(),
                                child: Container(
                                  child: Assets.icons.icDownArrow.toGetSvg(),
                                ),
                              ),
                              hintText: LocaleKeys
                                  .profile_requests_request_permission_select_permission
                                  .tr(),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const ProjectPadding.symmetricLargeV()
                            .copyWith(bottom: 8),
                        child: const CustomAutoSizeTextForTitle(
                          text: LocaleKeys
                              .profile_requests_request_permission_dates,
                        ),
                      ),
                      buildDateTextField(
                        text: LocaleKeys
                            .profile_requests_request_permission_start_date,
                        textEditingController: textEditingControllerStartDate,
                        onTap: () =>
                            buildShowModalBottomSheetStartDate(context),
                      ),
                      Padding(
                        padding: const ProjectPadding.symmetricMediumV(),
                        child: buildDateTextField(
                          text: LocaleKeys
                              .profile_requests_request_permission_end_date,
                          textEditingController: textEditingControllerEndDate,
                          onTap: () =>
                              buildShowModalBottomSheetEndDate(context),
                        ),
                      ),
                      BlocListener<ProfileRequestPermissionBloc,
                          ProfileRequestPermissionState>(
                        listener: (context, state) {
                          if (state.endDate != null &&
                              state.startDate != null) {
                            textEditingControllerSumDate.text = state.endDate!
                                .difference(state.startDate!)
                                .inDays
                                .toString();
                          }
                        },
                        child: buildDateTextField(
                          readOnly: true,
                          textEditingController: textEditingControllerSumDate,
                          text: LocaleKeys
                              .profile_requests_request_permission_sum_permission_days,
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const ProjectPadding.symmetricLargeV()
                            .copyWith(bottom: 0),
                        child: CustomAutoSizeTextForTitle(
                          text: LocaleKeys
                              .profile_requests_request_permission_explanation
                              .tr(),
                        ),
                      ),
                      Padding(
                        padding: const ProjectPadding.symmetricSmallV(),
                        child: CustomMultilineTextFormField(
                          controller: textEditingControllerExplanation,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),

                // const Spacer(
                //   flex: 6,
                // ),
                Padding(
                  padding: const ProjectPadding.onlyBottomLarge(),
                  child: buidButton(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buidButton(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: context.sized.width,
      child: BlocConsumer<ProfileRequestPermissionBloc,
          ProfileRequestPermissionState>(
        listener: (context, state) {
          if (state.endDate != null &&
              state.startDate != null &&
              state.permissionType != null) {
            profileRequestPermissionBloc.changeButtonEnable(
              value: true,
            );
          } else {
            profileRequestPermissionBloc.changeButtonEnable(
              value: false,
            );
          }
        },
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () async {
              if (state.buttonIsEnabled) {
                await buildShowBottomSheetRequest(context);
                await context.router.pop();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: state.buttonIsEnabled
                  ? ColorName.blueBase
                  : ColorName.neutral300,
            ),
            child: AutoSizeText(
              LocaleKeys.profile_requests_request_permission_button.tr(),
              style: textTheme.titleLarge!.copyWith(
                color: state.buttonIsEnabled
                    ? ColorName.neutral0
                    : ColorName.neutral500,
              ),
            ),
          );
        },
      ),
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
            LocaleKeys.profile_requests_request_type_request_to_permission.tr(),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: ColorName.neutral400),
          ),
        ],
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

  SizedBox buildDateTextField({
    required String text,
    required VoidCallback onTap,
    TextEditingController? textEditingController,
    bool readOnly = false,
  }) {
    return SizedBox(
      height: 40.h,
      child: TextFormField(
        showCursor: false,
        keyboardType: TextInputType.none,
        onTap: onTap,
        controller: textEditingController,
        readOnly: readOnly,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: ProjectBorderRadius.allCircleMedium().r,
          ),
          hintText: text.tr(),
        ),
      ),
    );
  }

  Future<void> buildShowModalBottomSheetEndDate(BuildContext context) {
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
                  minDate: DateTime.now(),
                  initialSelectedDate: DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day + 1,
                  ),
                  maxDate: DateTime(2100),
                  onSelectionChanged: onSelectionChangedEndDate,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> buildShowModalBottomSheetStartDate(BuildContext context) {
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
                  minDate: DateTime(
                    DateTime.now().year,
                    DateTime.now().month - 1,
                    DateTime.now().day,
                  ),
                  initialSelectedDate: DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day - 1,
                  ),
                  maxDate: DateTime(2100),
                  onSelectionChanged: onSelectionChangedStartDate,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void onSelectionChangedStartDate(DateRangePickerSelectionChangedArgs args) {
    profileRequestPermissionBloc.changeStartDate(args.value as DateTime);
    textEditingControllerStartDate.text =
        DateFormat('dd.MM.yyyy').format(args.value as DateTime);
    context.router.pop();
  }

  void onSelectionChangedEndDate(DateRangePickerSelectionChangedArgs args) {
    profileRequestPermissionBloc.changeEndDate(args.value as DateTime);
    textEditingControllerEndDate.text =
        DateFormat('dd.MM.yyyy').format(args.value as DateTime);
    context.router.pop();
  }
}
