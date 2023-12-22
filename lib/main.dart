import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/product/init/application_initialze.dart';
import 'package:red_events_mobile_app_defult/product/init/product_localization.dart';
import 'package:red_events_mobile_app_defult/product/init/theme/custom_dark_theme.dart';
import 'package:red_events_mobile_app_defult/product/init/theme/custom_light_theme.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';

void main() async {
  await ApplicationInitialize().setup();
  runApp(ProductLocalization(child: const _MyApp()));
}

final class _MyApp extends StatelessWidget {
  const _MyApp();
  static final _appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
    );
  }
}
