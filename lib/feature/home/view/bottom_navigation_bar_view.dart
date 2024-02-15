import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/home/wiew_model/bottom_navigation_view_model.dart';
import 'package:red_events_mobile_app_defult/feature/home/wiew_model/mixin/bottom_navigation_bar_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/home/wiew_model/state/bottom_navigation_bar_state.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class BottomNAvigationBarView extends StatefulWidget {
  const BottomNAvigationBarView({super.key});

  @override
  State<BottomNAvigationBarView> createState() =>
      _BottomNAvigationBarViewState();
}

class _BottomNAvigationBarViewState extends BaseState<BottomNAvigationBarView>
    with BottomNavigationBarMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bottomNavigationBarViewModel,
      child:
          BlocBuilder<BottomNavigationBarViewModel, BottomNavigationBarState>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: ColorName.blueBase,
              shape: const CircleBorder(),
              child: Assets.icons.icQrCode.toGetSvg(),
              onPressed: () {
                context.router.push(const QRCameraRoute());
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar.builder(
              itemCount: iconList.length,
              height: 55.h,
              tabBuilder: (index, value) {
                return Padding(
                  padding: const ProjectPadding.allSmall(),
                  child: Column(
                    children: [
                      if (index == state.activePage)
                        Expanded(child: iconSelectedList[index])
                      else
                        Expanded(child: iconList[index]),
                      Expanded(
                        child: AutoSizeText(
                          iconText[index].tr(),
                          style: textTheme.titleSmall!.copyWith(
                            fontSize: 10.r,
                            color: index == state.activePage
                                ? ColorName.blueBase
                                : ColorName.neutral300,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              backgroundColor: ColorName.neutral0,
              splashColor: ColorName.blueBase,
              activeIndex: state.activePage,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.defaultEdge,
              onTap: changePage,
            ),
            body: IndexedStack(
              index: state.activePage,
              children: screens,
            ),
            // body: screens[state.activePage],
          );
        },
      ),
    );
  }
}
