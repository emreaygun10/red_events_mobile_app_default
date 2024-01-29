import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/cubit/profile_request_others_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/mixins/profile_request_others_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/state/profile_request_other_state.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_autosizetext_for_title.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_multiline_textformfield.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_show_manager_bottom_sheet.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
final class ProfileRequestOthersView extends StatefulWidget {
  const ProfileRequestOthersView({super.key});

  @override
  State<ProfileRequestOthersView> createState() =>
      _ProfileRequestOthersViewState();
}

class _ProfileRequestOthersViewState extends BaseState<ProfileRequestOthersView>
    with ProfileRequestOtherMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileRequestOtherBloc,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Form(
          child: Padding(
            padding: const ProjectPadding.scaffold(),
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
                            .profile_requests_request_permission_explanation,
                      ),
                      Padding(
                        padding: const ProjectPadding.symmetricSmallV(),
                        child: CustomMultilineTextFormField(
                          valueChanged:
                              profileRequestOtherBloc.changeExplanation,
                          controller: textEditingControllerExplanation,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const ProjectPadding.onlyBottomLarge(),
                  child: buildButton(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildButton(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: context.sized.width,
      child: BlocBuilder<ProfileRequestOthersBloc, ProfileRequestOthersState>(
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () async {
              await buildShowBottomSheetRequest(context);
              await context.router.pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: state.explanation != null
                  ? ColorName.blueBase
                  : ColorName.neutral200,
            ),
            child: AutoSizeText(
              LocaleKeys.profile_requests_report_notification_button.tr(),
              style: textTheme.titleLarge!.copyWith(
                color: state.explanation != null
                    ? ColorName.neutral0
                    : ColorName.neutral400,
              ),
            ),
          );
        },
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
            LocaleKeys.profile_requests_request_type_request_to_leave.tr(),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: ColorName.neutral400),
          ),
        ],
      ),
    );
  }
}
