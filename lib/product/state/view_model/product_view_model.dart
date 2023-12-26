import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';
import 'package:red_events_mobile_app_defult/product/state/view_model/product_state.dart';

final class ProductViewModel extends BaseCubit<ProductState> {
  ProductViewModel()
      : super(
          ProductState(
            themeMode: SchedulerBinding
                        .instance.platformDispatcher.platformBrightness ==
                    Brightness.light
                ? ThemeMode.light
                : ThemeMode.dark,
          ),
        );

  /// Get Current Theme Mode
  ThemeMode get getCurrentThemeMode => state.themeMode;

  /// Change theme mode
  /// themeMode is [ThemeMode.light] or [ThemeMode.dark]
  ///
  void changeThemeMode() {
    switch (state.themeMode) {
      case ThemeMode.light:
        emit(state.copyWith(themeMode: ThemeMode.dark));
      case ThemeMode.dark:
        emit(state.copyWith(themeMode: ThemeMode.light));
      case ThemeMode.system:
        emit(state.copyWith(themeMode: ThemeMode.system));
    }
  }
}
