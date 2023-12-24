import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_events_mobile_app_defult/product/init/application_initialze.dart';
import 'package:red_events_mobile_app_defult/product/init/product_localization.dart';
import 'package:red_events_mobile_app_defult/product/init/state_initialze.dart';
import 'package:red_events_mobile_app_defult/product/init/theme/custom_dark_theme.dart';
import 'package:red_events_mobile_app_defult/product/init/theme/custom_light_theme.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/view_model/product_view_model.dart';
import 'package:widgets/widgets.dart';

void main() async {
  await ApplicationInitialize().setup();
  runApp(
    DevicePreview(
      builder: (context) =>
          ProductLocalization(child: const StateInitialize(child: _MyApp())),
    ),
  );
}

final class _MyApp extends StatelessWidget {
  const _MyApp();
  static final _appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: CustomResponsive.build,
      routerConfig: _appRouter.config(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      themeMode: context.watch<ProductViewModel>().state.themeMode,
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
    );
  }
}
