import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/department_model.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/mixin/add_department_mixin.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/linearprogress_enums.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_personnel_top_stack.dart';
import 'package:widgets/widgets.dart';

@RoutePage<DepartmentModel>()
class AddDepartmentView extends StatefulWidget {
  const AddDepartmentView({super.key});

  @override
  State<AddDepartmentView> createState() => _AddDepartmentView();
}

class _AddDepartmentView extends BaseState<AddDepartmentView>
    with AddDepartmentMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(),
      body: ListView(
        //physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          const CustomPersonnelTopStack(
            linearProgressEnum: LinearProgressEnum.levelOneInFive,
            text: LocaleKeys.setup_company_info_title,
            maxLevel: '5',
          ),
          Padding(
            padding: const ProjectPadding.scaffold(),
            child: GestureDetector(
              onTap: () => context.router.push(const AddDepartmentFormRoute()),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(16),
                dashPattern: const [10, 5, 10, 5],
                strokeCap: StrokeCap.round,
                color: ColorName.neutral300,
                child: SizedBox(
                  width: context.sized.width,
                  height: 120.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40.h,
                        width: 40.w,
                        padding: const ProjectPadding.allSmall(),
                        decoration: const BoxDecoration(
                          color: ColorName.neutral300,
                          shape: BoxShape.circle,
                        ),
                        child: Assets.icons.icAdd.toGetSvg(),
                      ),
                      const AutoSizeText('Departmant Ekle'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Container(
        height: 40.h,
        width: 40.w,
        padding: const ProjectPadding.allXSmall(),
        child: Assets.icons.icLogoDark.toGetSvg(),
      ),
      actions: [
        Padding(
          padding: const ProjectPadding.scaffold(),
          child: Container(
            decoration: BoxDecoration(
              color: ColorName.neutral100.withOpacity(0.7),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(6),
            height: 30.h,
            width: 30.w,
            child: Assets.icons.icClose
                .toGetSvgWithColor(color: ColorName.blueBase),
          ),
        ),
      ],
    );
  }
}
