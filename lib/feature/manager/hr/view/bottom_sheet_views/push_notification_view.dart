import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/view/mixin/push_notification_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/peronnel_model.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class PushNotificationView extends StatefulWidget {
  const PushNotificationView({required this.list, super.key});

  final List<PersonnelModel> list;
  @override
  State<PushNotificationView> createState() => _PushNotificationViewState();
}

class _PushNotificationViewState extends BaseState<PushNotificationView>
    with PushNotificationMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: buildBottomSheet(context),
      appBar: buildAppBar(context),
      body: Form(
        child: Padding(
          padding: const ProjectPadding.scaffold(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const ProjectPadding.symmetricNormalV(),
                child: buildColumn(
                  title: LocaleKeys
                      .manager_bottom_sheet_push_notification_notification_title,
                  hint: LocaleKeys
                      .manager_bottom_sheet_push_notification_notification_title_hint,
                  controller: textTitleEditingController,
                ),
              ),
              buildColumn(
                title:
                    LocaleKeys.manager_bottom_sheet_push_notification_comment,
                hint: LocaleKeys
                    .manager_bottom_sheet_push_notification_comment_hint,
                controller: textContentEditingController,
              ),
              const Spacer(
                flex: 8,
              ),
              SizedBox(
                height: 59,
                width: context.sized.width,
                child: ElevatedButton(
                  child: AutoSizeText(
                    LocaleKeys.manager_bottom_sheet_push_notification_button.tr(
                      args: [widget.list.length.toString()],
                    ),
                    style: textTheme.titleLarge!
                        .copyWith(color: ColorName.neutral0),
                  ),
                  onPressed: () {
                    solidController.show();
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
      leadingWidth: 90,
      titleSpacing: 0,
      leading: Padding(
        padding: const ProjectPadding.symmetricSmallV(),
        child: GestureDetector(
          onTap: () => context.router.pop(),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorName.neutral200,
            ),
            child: Assets.icons.icArroeLeftS.toGetSvg(),
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        LocaleKeys.manager_bottom_sheet_push_notification_title.tr(),
        style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }

  SolidBottomSheet buildBottomSheet(BuildContext context) {
    return SolidBottomSheet(
      controller: solidController,
      headerBar: const SizedBox(),
      body: Padding(
        padding: const ProjectPadding.symmetricSmallH(),
        child: Container(
          padding: const ProjectPadding.scaffold()
              .copyWith(
                top: 20,
              )
              .r,
          height: 450.h,
          width: context.sized.width,
          decoration: BoxDecoration(
            color: ColorName.neutral0,
            borderRadius: BorderRadius.all(const Radius.circular(20).r),
          ),
          child: Wrap(
            children: [
              Column(
                children: [
                  AutoSizeText(
                    LocaleKeys.profile_requests_request_permission_information
                        .tr(),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const Padding(
                    padding: ProjectPadding.symmetricSmallV(),
                    child: Divider(
                      height: 2,
                      color: ColorName.neutral300,
                    ),
                  ),
                  SizedBox(
                    height: 450.h,
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
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorName.neutral200.withOpacity(0.4),
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
                          textAlign: TextAlign.center,
                          LocaleKeys
                              .manager_bottom_sheet_push_notification_success
                              .tr(),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const Spacer(
                          flex: 3,
                        ),
                        Padding(
                          padding: const ProjectPadding.scaffold(),
                          child: SizedBox(
                            height: 56.h,
                            width: context.sized.width,
                            child: ElevatedButton(
                              onPressed: () {
                                context.router.pushAndPopUntil(
                                  const ManagerBottomNavigationRoute(),
                                  predicate: (route) => false,
                                );
                              },
                              child: AutoSizeText(
                                LocaleKeys.general_button_okay.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: ColorName.neutral0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildColumn({
    required String title,
    required String hint,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          title.tr(),
          style: textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w800,
            color: ColorName.neutral700,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          width: context.sized.width,
          child: TextFormField(
            maxLines: 6,
            minLines: 1,
            controller: controller,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hint.tr(),
              hintStyle: textTheme.titleMedium,
            ),
            maxLength: 200,
          ),
        ),
      ],
    );
  }
}
