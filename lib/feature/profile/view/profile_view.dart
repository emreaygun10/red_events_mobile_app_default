import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_account_operation_item.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_chip.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_profile_image_row.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:widgets/widgets.dart';

/// User Profile Base Page
@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      //appBar: buildAppBar(),
      body: Column(
        //physics: const NeverScrollableScrollPhysics(),
        //padding: EdgeInsets.zero,
        children: [
          Container(
            height: 340.h,
            decoration: const BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  ColorName.blueBase,
                  ColorName.neutral0,
                ],
                stops: [
                  0.0,
                  0.7,
                ],
              ),
            ),
            child: buildProfileTopContainer(context),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                buildAccountOperationText(context),
                buildOperationsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// App Bar
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      actions: [
        Padding(
          padding: const ProjectPadding.scaffold(),
          child: GestureDetector(
            onTap: () => context.router.push(const ProfileNotificationRoute()),
            child: Assets.icons.icNotification4Line
                .svg(package: ModuleEnum.gen.value),
          ),
        ),
      ],
    );
  }

  /// Include user account operations
  ColoredBox buildOperationsList() {
    return ColoredBox(
      color: ColorName.neutral0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const ProjectPadding.symmetricSmallV(),
            child: CustomAccountOperationItem(
              labelIcon: Assets.icons.icBankCardLine
                  .toGetSvgWithColor(color: ColorName.blueBase),
              pageRouteInfo: const ProfileProgressPaymentRoute(),
              text: LocaleKeys.profile_list_progress_payment,
            ),
          ),
          Padding(
            padding: const ProjectPadding.symmetricSmallV(),
            child: CustomAccountOperationItem(
              labelIcon: Assets.icons.icFolderShieldLine
                  .toGetSvgWithColor(color: ColorName.blueBase),
              pageRouteInfo: const ProfileDocumentsRoute(),
              text: LocaleKeys.profile_list_files,
            ),
          ),
          Padding(
            padding: const ProjectPadding.symmetricSmallV(),
            child: CustomAccountOperationItem(
              labelIcon: Assets.icons.icCalendarEventLine
                  .toGetSvgWithColor(color: ColorName.blueBase),
              pageRouteInfo: const ProfileRequestRoute(),
              text: LocaleKeys.profile_list_request,
            ),
          ),
          Padding(
            padding: const ProjectPadding.symmetricSmallV(),
            child: CustomAccountOperationItem(
              labelIcon: Assets.icons.icFolderShieldLine
                  .toGetSvgWithColor(color: ColorName.blueBase),
              pageRouteInfo: const ProfilePerformanceRoute(),
              text: LocaleKeys.profile_list_performance,
            ),
          ),
          Padding(
            padding: const ProjectPadding.symmetricSmallV(),
            child: CustomAccountOperationItem(
              labelIcon: Assets.icons.icFileMarkLine
                  .toGetSvgWithColor(color: ColorName.blueBase),
              pageRouteInfo: const ProfileEducationRoute(),
              text: LocaleKeys.profile_list_educations,
            ),
          ),
        ],
      ),
    );
  }

  Padding buildAccountOperationText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 12, top: 24).r,
      child: AutoSizeText(
        LocaleKeys.profile_account_operations.tr(),
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: ColorName.neutral500),
      ),
    );
  }

  ///include user information
  ColoredBox buildProfileTopContainer(BuildContext context) {
    return ColoredBox(
      color: Colors.transparent,
      child: Column(
        children: [
          buildAppBar(context),
          const CustomProfileImageRow(
            jobText: 'Garson',
            imageUrl:
                'https://gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
          ),
          buildDescriptionStringColumn(context),
          buildChipRow(),
          buildMoreDetailButton(context),
        ],
      ),
    );
  }

  Padding buildMoreDetailButton(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.symmetricXSmallV().r,
      child: TextButton(
        child: AutoSizeText(
          LocaleKeys.profile_more_info.tr(),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: ColorName.neutral400,
                decoration: TextDecoration.underline,
              ),
        ),
        onPressed: () {
          context.router.push(const ProfileDetailRoute());
        },
      ),
    );
  }

  /// Include chips
  SizedBox buildChipRow() {
    return SizedBox(
      height: 28.h,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomChip(
            text: 'Food & Beverage',
          ),
          CustomChip(
            text: 'Manzara Restaurant',
          ),
        ],
      ),
    );
  }

  /// include user description
  Padding buildDescriptionStringColumn(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.symmetricNormalH()
          .copyWith(bottom: 20, top: 16)
          .r,
      child: AutoSizeText(
        'Burak Yılmaz Güven, 35',
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
