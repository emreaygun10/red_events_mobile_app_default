import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/department_model.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/mixin/add_department_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/add_department_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/state/add_department_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/linearprogress_enums.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_personnel_top_stack.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class AddDepartmentView extends StatefulWidget {
  const AddDepartmentView({super.key});

  @override
  State<AddDepartmentView> createState() => _AddDepartmentView();
}

class _AddDepartmentView extends BaseState<AddDepartmentView>
    with AddDepartmentMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => addDepartmentBloc,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: buildAppBar(),
        body: Column(
          children: [
            const CustomPersonnelTopStack(
              linearProgressEnum: LinearProgressEnum.levelOneInFive,
              text: LocaleKeys.setup_company_info_title,
              maxLevel: '5',
            ),
            biuldListView(),
            buildButton(context),
          ],
        ),
      ),
    );
  }

  Flexible biuldListView() {
    return Flexible(
      flex: 6,
      child: BlocBuilder<AddDepartmentBloc, AddDepartmentState>(
        builder: (context, state) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: listDepartments.isEmpty ? 1 : listDepartments.length + 1,
            itemBuilder: (context, index) {
              return listDepartments.isEmpty
                  ? buildDottedCard()
                  : index == listDepartments.length
                      ? buildDottedCard()
                      : buildDepartmentCard(context, index);
            },
          );
        },
      ),
    );
  }

  Flexible buildButton(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 58.h,
        width: context.sized.width,
        child: BlocBuilder<AddDepartmentBloc, AddDepartmentState>(
          builder: (context, state) {
            return Padding(
              padding: const ProjectPadding.scaffold(),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      state.isEmpty ? ColorName.neutral300 : ColorName.blueBase,
                ),
                onPressed: () {
                  state.isEmpty
                      ? null
                      : context.router.pushAndPopUntil(
                          const WorkTypeRoute(),
                          predicate: (route) => false,
                        );
                },
                child: AutoSizeText(
                  LocaleKeys.setup_add_department_button.tr(),
                  style: textTheme.titleLarge!.copyWith(
                    color: state.isEmpty
                        ? ColorName.neutral200
                        : ColorName.neutral0,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Padding buildDepartmentCard(BuildContext context, int index) {
    return Padding(
      padding: const ProjectPadding.scaffold().copyWith(bottom: 13).r,
      child: Container(
        padding: const ProjectPadding.allMedium(),
        height: 112.h,
        width: context.sized.width,
        decoration: BoxDecoration(
          border: Border.all(color: ColorName.neutral200, width: 2),
          borderRadius: ProjectBorderRadius.allCircleMedium(),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10).r,
              height: 40.h,
              width: 40.w,
              decoration: const BoxDecoration(
                color: ColorName.blueLight,
                shape: BoxShape.circle,
              ),
              child: Assets.icons.icBuilding.toGetSvg(),
            ),
            Padding(
              padding: const ProjectPadding.symmetricMediumH(),
              child: SizedBox(
                width: 221.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AutoSizeText(
                      listDepartments[index].companyName,
                      style: textTheme.titleLarge!.copyWith(
                        color: ColorName.neutral900,
                      ),
                    ),
                    AutoSizeText(
                      listDepartments[index].departmentManager,
                      style: textTheme.titleSmall!.copyWith(
                        color: ColorName.neutral400,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        AutoSizeText(
                          listDepartments[index].managerPhone,
                          style: textTheme.titleSmall!.copyWith(
                            color: ColorName.neutral400,
                          ),
                        ),
                        Assets.icons.icDot.toGetSvgWithColor(
                          color: ColorName.neutral400,
                        ),
                        AutoSizeText(
                          listDepartments[index].managerMail,
                          style: textTheme.titleSmall!.copyWith(
                            color: ColorName.neutral400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Assets.icons.icEditLine.toGetSvg(),
          ],
        ),
      ),
    );
  }

  Padding buildDottedCard() {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: BlocBuilder<AddDepartmentBloc, AddDepartmentState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () async {
              final departmentModel =
                  await context.router.push<DepartmentModel>(
                const AddDepartmentFormRoute(),
              );
              if (departmentModel != null) {
                addDepartmentBloc.changeModel(departmentModel);
                listDepartments.add(departmentModel);
                addDepartmentBloc.changeModelList(listDepartments);
                addDepartmentBloc.changeIsEmpty(false);
              }
            },
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
          );
        },
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
