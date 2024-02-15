import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/home/view/bottom_navigation_bar_view.dart';
import 'package:red_events_mobile_app_defult/feature/home/view/home_view.dart';
import 'package:red_events_mobile_app_defult/feature/home/wiew_model/bottom_navigation_view_model.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_view.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin BottomNavigationBarMixin on BaseState<BottomNAvigationBarView> {
  late final BottomNavigationBarViewModel _bottomNavigationBarViewModel;
  BottomNavigationBarViewModel get bottomNavigationBarViewModel =>
      _bottomNavigationBarViewModel;

  ///Bottom bar icons
  final List<Widget> iconList = [
    Assets.icons.icHomeBottomBar.toGetSvg(),
    Assets.icons.icMenuLine.toGetSvg(),
  ];

  ///Bottom bar icons
  final List<Widget> iconSelectedList = [
    Assets.icons.icHomeBottomBar.toGetSvgWithColor(
      color: ColorName.blueBase,
    ),
    Assets.icons.icMenuLine.toGetSvgWithColor(
      color: ColorName.blueBase,
    ),
  ];

  /// Icon texts
  final List<String> iconText = [
    LocaleKeys.home_app_name,
    LocaleKeys.home_operations,
  ];

  /// Bottom Bar Screens
  final List<Widget> screens = [const HomeView(), const ProfileView()];
  @override
  void initState() {
    _bottomNavigationBarViewModel = BottomNavigationBarViewModel();
    super.initState();
  }

  /// For change page
  void changePage(int index) {
    _bottomNavigationBarViewModel.changeActivePage(index);
  }
}
