import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_account_operation_item.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_chip.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_description_row.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_profile_image_row.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:widgets/widgets.dart';

/// User Profile Base Page
@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const ProjectPadding.scaffold(),
            child: Assets.icons.icEditLine.svg(package: ModuleEnum.gen.value),
          ),
        ],
      ),
      body: ListView(
        children: [
          buildProfileTopContainer(context),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 12).r,
                child: AutoSizeText(
                  LocaleKeys.profile_account_operations.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: ColorName.neutral500),
                ),
              ),
              Padding(
                padding: const ProjectPadding.symmetricMediumV(),
                child: CustomAccountOperationItem(
                  labelIcon: Assets.icons.icFolderShieldLine.svg(
                    package: ModuleEnum.gen.value,
                  ),
                  text: 'Evraklar',
                ),
              ),
              Padding(
                padding: const ProjectPadding.symmetricMediumV(),
                child: CustomAccountOperationItem(
                  labelIcon: Assets.icons.icFolderShieldLine.svg(
                    package: ModuleEnum.gen.value,
                  ),
                  text: 'Avans Yönetimi',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ///include user information
  SizedBox buildProfileTopContainer(BuildContext context) {
    return SizedBox(
      height: 261.h,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40).r,
            child: const CustomProfileImageRow(jobText: 'Garson'),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 64.h,
            width: 267.w,
            child: buildDescriptionStringColumn(context),
          ),
          SizedBox(
            height: 32.h,
          ),
          buildChipRow(),
        ],
      ),
    );
  }

  /// Include chips
  SizedBox buildChipRow() {
    return SizedBox(
      height: 28.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomChip(
            text: 'Food & Beverage',
            avatar:
                Assets.icons.icSuitcaseLine.svg(package: ModuleEnum.gen.value),
          ),
          CustomChip(
            text: 'Manzara Restaurant',
            avatar: Assets.icons.icBuilding.svg(package: ModuleEnum.gen.value),
          ),
        ],
      ),
    );
  }

  /// include user description
  Column buildDescriptionStringColumn(BuildContext context) {
    return Column(
      children: [
        AutoSizeText(
          'Başak Yılmaz Güven, 35',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const Padding(
          padding: ProjectPadding.symmetricSmallV(),
          child: CustomDescriptionRow(
            firstText: '53478556344',
            secondText: 'İstabul, Beşiktaş',
          ),
        ),
        const CustomDescriptionRow(
          firstText: 'ellen.rose@gmail.com',
          secondText: '+90 (555) 555 55 55',
          isWhatsappIcon: true,
        ),
      ],
    );
  }
}
