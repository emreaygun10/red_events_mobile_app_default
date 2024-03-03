import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/mixin/work_type_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/state/work_type_state.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/work_type_bloc.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/linearprogress_enums.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_personnel_top_stack.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class WorkTypeView extends StatefulWidget {
  const WorkTypeView({super.key});

  @override
  State<WorkTypeView> createState() => _WorkTypeViewState();
}

class _WorkTypeViewState extends BaseState<WorkTypeView> with WorkTypeMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => workTypeBloc,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: buildAppBar(),
        body: Column(
          children: [
            Flexible(
              flex: 8,
              child: BlocBuilder<WorkTypeBloc, WorkTypeState>(
                builder: (context, state) {
                  return ListView(
                    padding: EdgeInsets.zero,
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    children: [
                      const CustomPersonnelTopStack(
                        linearProgressEnum: LinearProgressEnum.levelThreeInFive,
                        text: LocaleKeys.setup_work_type_title,
                        maxLevel: '5',
                      ),
                      buildDepartmentSwitch(context),
                      if (state.switchIsEnable)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildCustomTitle(
                              LocaleKeys.setup_work_type_daily_clock,
                            ),
                            buildDailyWorkType(),
                            buildCustomTitle(
                              LocaleKeys.setup_work_type_question_one,
                            ),
                            SizedBox(
                              height: 180.h,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: questionsOne.length,
                                itemBuilder: (context, index) =>
                                    BlocBuilder<WorkTypeBloc, WorkTypeState>(
                                  builder: (context, state) {
                                    return Padding(
                                      padding: const ProjectPadding.scaffold()
                                          .copyWith(top: 8),
                                      child: buildQuestionLine(
                                        index: index,
                                        text: questionsOne[index],
                                        group: state.questionOne,
                                        onTap: (_) => workTypeBloc
                                            .changeQuestionOne(index),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            buildCustomTitle(
                              LocaleKeys.setup_work_type_question_two,
                            ),
                            SizedBox(
                              height: 128.h,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: questionsTwo.length,
                                itemBuilder: (context, index) =>
                                    BlocBuilder<WorkTypeBloc, WorkTypeState>(
                                  builder: (context, state) {
                                    return Padding(
                                      padding: const ProjectPadding.scaffold()
                                          .copyWith(top: 8),
                                      child: buildQuestionLine(
                                        index: index,
                                        text: questionsTwo[index],
                                        group: state.questionTwo,
                                        onTap: (_) => workTypeBloc
                                            .changeQuestionTwo(index),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            buildCustomTitle(
                              LocaleKeys.setup_work_type_question_three,
                            ),
                            SizedBox(
                              height: 128.h,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: questionsThree.length,
                                itemBuilder: (context, index) =>
                                    BlocBuilder<WorkTypeBloc, WorkTypeState>(
                                  builder: (context, state) {
                                    return Padding(
                                      padding: const ProjectPadding.scaffold()
                                          .copyWith(top: 8),
                                      child: buildQuestionLine(
                                        index: index,
                                        text: questionsThree[index],
                                        group: state.questionThree,
                                        onTap: (_) => workTypeBloc
                                            .changeQuestionThree(index),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  );
                },
              ),
            ),
            BlocConsumer<WorkTypeBloc, WorkTypeState>(
              listener: (context, state) {
                if ((state.questionOne != -1 &&
                        state.questionTwo != -1 &&
                        state.questionThree != -1 &&
                        state.switchIsEnable == true) ||
                    state.switchIsEnable == false) {
                  workTypeBloc.changeIsDisable(false);
                } else {
                  workTypeBloc.changeIsDisable(true);
                }
              },
              builder: (context, state) {
                return Flexible(
                  child: Padding(
                    padding: const ProjectPadding.scaffold(),
                    child: SizedBox(
                      height: 56.h,
                      width: context.sized.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: state.isDisable
                              ? ColorName.neutral200
                              : ColorName.blueBase,
                        ),
                        onPressed: () {},
                        child: AutoSizeText(
                          'Devam Et',
                          style: textTheme.titleLarge!.copyWith(
                            color: state.isDisable
                                ? ColorName.neutral400
                                : ColorName.neutral0,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Container buildQuestionLine({
    required String text,
    required int index,
    required int group,
    required void Function(int? value) onTap,
  }) {
    return Container(
      padding: const ProjectPadding.allMedium(),
      height: 52.h,
      decoration: BoxDecoration(
        border: Border.all(color: ColorName.neutral200),
        borderRadius: ProjectBorderRadius.allCircleMedium(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            text,
            style: textTheme.titleMedium!.copyWith(
              color: ColorName.neutral600,
              fontWeight: FontWeight.w700,
            ),
          ),
          BlocBuilder<WorkTypeBloc, WorkTypeState>(
            builder: (context, state) {
              return buildRadio(index, group, (value) => onTap(value));
            },
          ),
        ],
      ),
    );
  }

  Padding buildDailyWorkType() {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: Container(
        padding: const ProjectPadding.allSmall(),
        height: 38.h,
        decoration: BoxDecoration(
          border: Border.all(color: ColorName.neutral200),
          borderRadius: ProjectBorderRadius.allCircleMedium(),
        ),
        child: BlocBuilder<WorkTypeBloc, WorkTypeState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  padding: const ProjectPadding.allXSmall().r,
                  onPressed: () => workTypeBloc.changeClock(state.clock - 1),
                  icon: const Icon(Icons.remove),
                ),
                AutoSizeText(
                  LocaleKeys.setup_work_type_clock.tr(
                    args: [state.clock.toString()],
                  ),
                  style: textTheme.titleMedium,
                ),
                IconButton(
                  padding: const ProjectPadding.allXSmall().r,
                  onPressed: () => workTypeBloc.changeClock(state.clock + 1),
                  icon: const Icon(Icons.add),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Padding buildCustomTitle(String title) {
    return Padding(
      padding: const ProjectPadding.scaffold().copyWith(top: 32, bottom: 3).r,
      child: AutoSizeText(
        title.tr(),
        style: textTheme.titleMedium!.copyWith(
          color: ColorName.neutral900,
          fontWeight: FontWeight.w700,
        ),
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

  Padding buildDepartmentSwitch(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: Container(
        padding: const ProjectPadding.allMedium(),
        height: 82.h,
        width: context.sized.width,
        decoration: BoxDecoration(
          borderRadius: ProjectBorderRadius.allCircleMedium(),
          border: Border.all(color: ColorName.neutral200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AutoSizeText(
                    LocaleKeys.setup_work_type_card.tr(),
                    style: textTheme.titleMedium!
                        .copyWith(color: ColorName.neutral900),
                  ),
                ),
                BlocBuilder<WorkTypeBloc, WorkTypeState>(
                  builder: (context, state) {
                    return SizedBox(
                      height: 20.h,
                      child: CupertinoSwitch(
                        activeColor: ColorName.blueBase,
                        value: state.switchIsEnable,
                        onChanged: (value) {
                          workTypeBloc
                              .changeSwitchIsEnable(!state.switchIsEnable);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            AutoSizeText(
              LocaleKeys.setup_add_department_is_part_of_department_info.tr(),
              style:
                  textTheme.titleSmall!.copyWith(color: ColorName.neutral500),
            ),
          ],
        ),
      ),
    );
  }

  Radio<int> buildRadio(
    int index,
    int groupValue,
    void Function(int? value) onTap,
  ) {
    return Radio<int>(
      value: index,
      groupValue: groupValue,
      onChanged: onTap,
    );
  }
}
