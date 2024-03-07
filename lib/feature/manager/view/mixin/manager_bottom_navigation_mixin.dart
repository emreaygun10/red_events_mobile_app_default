import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/view/hr_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/view/manager_bottom_navigation_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/view_model/manager_bottom_navigation_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin ManagerBottomNavigationMixin on BaseState<ManagerBottomNavigationView> {
  late final ManagerBottomNavigationBloc managerBottomNavigationBloc;

  ///Bottom bar icons
  final List<Widget> iconList = [
    Assets.icons.icHomeBottomBar.toGetSvg(),
    Assets.icons.icBankCardLine.toGetSvg(),
    Assets.icons.icNotification05Line.toGetSvg(),
    Assets.icons.icUser2.toGetSvg(),
  ];

  ///Bottom bar icons
  final List<Widget> iconSelectedList = [
    Assets.icons.icHomeBottomBar.toGetSvgWithColor(
      color: ColorName.blueBase,
    ),
    Assets.icons.icBankCardLine.toGetSvgWithColor(
      color: ColorName.blueBase,
    ),
    Assets.icons.icNotification05Line.toGetSvgWithColor(
      color: ColorName.blueBase,
    ),
    Assets.icons.icUser2.toGetSvgWithColor(
      color: ColorName.blueBase,
    ),
  ];

  /// Icon texts
  final List<String> iconText = [
    'Anasayfa',
    'Finans',
    'Bildirimler',
    'Hesabım',
  ];

  /// Bottom Bar Screens
  final List<Widget> screens = [
    const HrView(),
  ];

  @override
  void initState() {
    managerBottomNavigationBloc = ManagerBottomNavigationBloc();
    super.initState();
  }

  /// For change page
  void changePage(int index) {
    managerBottomNavigationBloc.changeActivePage(index);
  }
}
