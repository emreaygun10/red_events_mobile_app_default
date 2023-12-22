import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:logger/logger.dart';
import 'package:red_events_mobile_app_defult/product/init/config/product_environment.dart';
import 'package:red_events_mobile_app_defult/product/state/container/product_state_container.dart';

@immutable

/// This class is used to initialize the application process
final class ApplicationInitialize {
  /// Project basic required initialize
  Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();

    await runZonedGuarded<Future<void>>(_initialize, (error, stack) {
      Logger().e(error);
    });
  }

  /// This method is used to initialize the application process
  Future<void> _initialize() async {
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );

    /// TODO: init package move to splash
    await DeviceUtility.instance.initPackageInfo();
    FlutterError.onError = (details) {
      /// Insert crashlytics log insert here
      Logger().e(details.exceptionAsString());
    };

    ProductEnvironment.general();

    /// It must be call after [ProductEnvironment]
    ProductContainer.setup();
  }
}
