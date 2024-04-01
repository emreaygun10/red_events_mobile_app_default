import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/manager/view/mixin/manager_bottom_navigation_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/manager/view_model/manager_bottom_navigation_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/manager/view_model/state/manager_bottom_navigation_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
final class ManagerBottomNavigationView extends StatefulWidget {
  const ManagerBottomNavigationView({super.key});

  @override
  State<ManagerBottomNavigationView> createState() =>
      _BottomNAvigationBarViewState();
}

class _BottomNAvigationBarViewState
    extends BaseState<ManagerBottomNavigationView>
    with ManagerBottomNavigationMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => managerBottomNavigationBloc,
      child: BlocBuilder<ManagerBottomNavigationBloc,
          ManagerBottomNavigationState>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () => managerBottomNavigationBloc
                  .changeActivePage(screens.length - 1),
              child: Container(
                height: 64.h,
                width: 64.w,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Assets.icons.icShiftLogo.toGetSvg(),
              ),
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
              notchSmoothness: NotchSmoothness.sharpEdge,
              onTap: changePage,
            ),
            body: IndexedStack(
              index: state.activePage,
              children: screens,
            ),
            // body: const Scaffold(
            //   body: Center(
            //     child: AutoSizeText('deneme'),
            //   ),
            // ),
          );
        },
      ),
    );
  }
}
