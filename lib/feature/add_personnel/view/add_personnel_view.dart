import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_top_stack.dart';
import 'package:widgets/widgets.dart';

part '../../../product/widget/custom_list_container_add_personnel.dart';

@RoutePage()

///Add Personnel Start Page
class AddPersonnelView extends StatelessWidget {
  const AddPersonnelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(context),
      body: Column(
        children: [
          const CustomTopStack(
            title: LocaleKeys.add_personnel_title,
            desc: LocaleKeys.add_personnel_desc,
          ),
          buildListColumn(),
          const Spacer(
            flex: 8,
          ),
          buildButton(context),
          const Spacer(),
        ],
      ),
    );
  }

  Column buildListColumn() {
    return Column(
      children: [
        CustomListContainer(
          preFix: Assets.icons.icPage.svg(package: ModuleEnum.gen.value),
          text: LocaleKeys.add_personnel_base_information,
          postFix: Assets.icons.icArrowRight.svg(
            package: ModuleEnum.gen.value,
            color: ColorName.neutral0,
          ),
        ),
        Padding(
          padding: const ProjectPadding.symmetricNormalV(),
          child: CustomListContainer(
            preFix:
                Assets.icons.icFolderOpen.svg(package: ModuleEnum.gen.value),
            text: LocaleKeys.add_personnel_base_information,
          ),
        ),

        /// TODO: Üyelik leveline göre burayı kapat
        CustomListContainer(
          preFix: Assets.icons.icTodo.svg(package: ModuleEnum.gen.value),
          text: LocaleKeys.add_personnel_base_information,
        ),
      ],
    );
  }

  Padding buildButton(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: SizedBox(
        height: 56.h,
        width: context.sized.width,
        child: ElevatedButton(
          onPressed: () {
            context.router.push(const BaseInformationRoute());
          },
          child: AutoSizeText(
            LocaleKeys.add_personnel_buttons_personnel_add_card_.tr(),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: ColorName.neutral0),
          ),
        ),
      ),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Assets.icons.icLogoDark.svg(
      package: ModuleEnum.gen.value,
      height: 40,
      width: 40,
    ),
    actions: [
      TextButton(
        onPressed: () {
          context.router.push(const ProfileRoute());
        },
        child: const Text(
          'Profil',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ],
  );
}
