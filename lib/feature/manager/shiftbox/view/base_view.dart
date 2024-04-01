import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/mixin/base_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/shiftbox_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/bloc/base_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/state/base_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/manager_enum.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
final class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends BaseState<BaseView> with BaseMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => baseBloc,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ColorName.blueLight, ColorName.neutral100],
              stops: [0, 0.5],
            ),
          ),
          child: Padding(
            padding: const ProjectPadding.scaffold().copyWith(top: 120.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTopFilterRow(context),
                Expanded(
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => contets[index],
                    itemCount: contets.length,
                    controller: pageController,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildTopFilterRow(BuildContext context) {
    return SizedBox(
      height: 32.h,
      width: context.sized.width,
      child: BlocBuilder<BaseBloc, BaseViewState>(
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                buildTopFilterList(context: context, index: index),
            itemCount: ShiftBoxTopTitleEnum.values.length,
          );
        },
      ),
    );
  }

  Padding buildTopFilterList({
    required BuildContext context,
    required int index,
  }) {
    return Padding(
      padding: const ProjectPadding.symmetricXSmallH(),
      child: GestureDetector(
        onTap: () => changePage(index),
        child: Chip(
          clipBehavior: Clip.antiAlias,
          shape: const StadiumBorder(
            side: BorderSide(width: 0, color: ColorName.neutral0),
          ),
          backgroundColor: baseBloc.state.pageIndex == index
              ? const Color(0xFF4C7A96)
              : ColorName.neutral0,
          padding: const ProjectPadding.allSmall(),
          label: AutoSizeText(
            ShiftBoxTopTitleEnum.values[index].value,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: baseBloc.state.pageIndex == index
                      ? ColorName.neutral900
                      : ColorName.neutral0,
                ),
          ),
        ),
      ),
    );
  }
}
