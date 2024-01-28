import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/cubit/profile_request_report_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/mixins/profile_request_report_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/state/profile_request_report_state.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_autosizetext_for_title.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_multiline_textformfield.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_show_manager_bottom_sheet.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class ProfileRequestReportView extends StatefulWidget {
  const ProfileRequestReportView({super.key});

  @override
  State<ProfileRequestReportView> createState() =>
      _ProfileRequestReportViewState();
}

class _ProfileRequestReportViewState extends BaseState<ProfileRequestReportView>
    with ProfileRequestReportMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileRequestReportBloc,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Form(
          child: Padding(
            padding: const ProjectPadding.scaffold(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                const CustomAutoSizeTextForTitle(
                  text: LocaleKeys.profile_requests_detail_page_permission_type,
                ),
                buildCustomTextFormFieldList(),
                Container(
                  height: 72.h,
                  padding: const ProjectPadding.allMedium(),
                  decoration: BoxDecoration(
                    color: ColorName.neutral0,
                    border: Border.all(color: ColorName.neutral200),
                    borderRadius: ProjectBorderRadius.allCircleMedium(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40.h,
                            width: 40.w,
                            padding: const ProjectPadding.allSmall(),
                            decoration: const BoxDecoration(
                              color: ColorName.neutral200,
                              shape: BoxShape.circle,
                            ),
                            child: Assets.icons.icFile.toGetSvg(),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AutoSizeText(
                                'Rapor',
                                style: textTheme.labelMedium,
                              ),
                              AutoSizeText(
                                'data',
                                style: textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                        width: 40.w,
                        child: Center(
                          child: DottedBorder(
                            color: ColorName.blueBase,
                            padding: const ProjectPadding.allSmall(),
                            dashPattern: const [6, 6, 6, 6],
                            borderType: BorderType.Circle,
                            child: const Icon(
                              Icons.add,
                              color: ColorName.blueBase,
                            ),
                          ),
                        ),
                      ),
                    ],
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
                const Spacer(
                  flex: 7,
                ),
                buildButton(context),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BlocBuilder<ProfileRequestReportBloc, ProfileRequestReportState>
      buildCustomTextFormFieldList() {
    return BlocBuilder<ProfileRequestReportBloc, ProfileRequestReportState>(
      builder: (context, state) {
        return Padding(
          padding: const ProjectPadding.symmetricSmallV(),
          child: SizedBox(
            height: 40.h,
            child: TextFormField(
              showCursor: false,
              keyboardType: TextInputType.none,
              controller: textEditingControllerReportType,
              onTap: () async {
                await showModalBottomSheet<Widget>(
                  isScrollControlled: true,
                  context: context,
                  showDragHandle: true,
                  builder: (context) {
                    return SizedBox(
                      height: context.sized.height * 0.4,
                      width: context.sized.width,
                      child: Padding(
                        padding: const ProjectPadding.scaffold(),
                        child: Column(
                          children: [
                            AutoSizeText(
                              LocaleKeys
                                  .profile_requests_report_notification_select_report_type
                                  .tr(),
                              style: textTheme.labelLarge,
                            ),
                            Expanded(
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: const AutoSizeText(
                                      'Sağlık Raporu',
                                    ),
                                    leading: Radio(
                                      fillColor: MaterialStateProperty
                                          .resolveWith<Color>((
                                        Set<MaterialState> states,
                                      ) {
                                        return state.groupIndex == index
                                            ? ColorName.blueBase
                                            : ColorName.neutral300;
                                      }),
                                      value: index,
                                      groupValue: state.groupIndex,
                                      onChanged: (value) {
                                        profileRequestReportBloc
                                            .changeGroupIndex(
                                          value!,
                                        );
                                        context.router.pop();
                                        textEditingControllerReportType.text =
                                            'Sağlık Raporu';
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
                                itemCount: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
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

  SizedBox buildButton(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: context.sized.width,
      child: BlocBuilder<ProfileRequestReportBloc, ProfileRequestReportState>(
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () async {
              await buildShowBottomSheetRequest(context);
              await context.router.pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  state.isLoaded && textEditingControllerReportType.text != ''
                      ? ColorName.blueBase
                      : ColorName.neutral200,
            ),
            child: AutoSizeText(
              LocaleKeys.profile_requests_report_notification_button.tr(),
              style: textTheme.titleLarge!.copyWith(
                color:
                    state.isLoaded && textEditingControllerReportType.text != ''
                        ? ColorName.neutral0
                        : ColorName.neutral400,
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
            LocaleKeys.profile_requests_request_type_report_notification.tr(),
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
}
