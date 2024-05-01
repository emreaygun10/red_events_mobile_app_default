import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/base_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/shift_list_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/shiftbox_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/weakly_shift_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/bloc/base_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin BaseMixin on BaseState<BaseView> {
  late final BaseBloc _baseBloc;
  late final List<Widget> _contents;
  late final PageController _pageController;

  BaseBloc get baseBloc => _baseBloc;
  List<Widget> get contets => _contents;
  PageController get pageController => _pageController;

  @override
  void initState() {
    _baseBloc = BaseBloc();
    _contents = [
      const ShiftBoxView(),
      const WeaklyShiftView(),
      const ShiftListView(),
      Container(
        color: ColorName.redBase,
      ),
      Container(
        color: ColorName.greenBase,
      ),
    ];
    _pageController = PageController(
      initialPage: _baseBloc.state.pageIndex,
    );
    super.initState();
  }

  void changePage(int index) {
    _baseBloc.changeMonth(index);
    pageController.jumpToPage(index);
  }
}
