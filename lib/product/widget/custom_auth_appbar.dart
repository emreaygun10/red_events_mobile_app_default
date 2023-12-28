import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:widgets/widgets.dart';

class CustomAuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAuthAppBar({
    required this.parentContext,
    super.key,
  });
  final BuildContext parentContext;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: Assets.icons.icLogoDark.svg(
        package: ModuleEnum.gen.value,
        height: 40.h,
        width: 40.w,
      ),
      leading: GestureDetector(
        onTap: () async {
          await parentContext.router.pop();
        },
        child: Padding(
          padding: const ProjectPadding.allSmall(),
          child: SizedBox(
            height: 24.h,
            width: 24.w,
            child: Assets.icons.icArrowLeftLine.svg(
              package: ModuleEnum.gen.value,
              color: ColorName.neutral0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
