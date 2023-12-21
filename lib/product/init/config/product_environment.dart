import 'package:flutter/foundation.dart';
import 'package:red_events_mobile_app_defult/product/init/config/dev_env.dart';
import 'package:red_events_mobile_app_defult/product/init/config/prod_env.dart';
import 'package:red_events_mobile_app_defult/product/init/config/product_configuration.dart';

/// Product environment manager
final class ProductEnvironment {
  ProductEnvironment.setup({required ProductConfiguration config}) {
    _config = config;
  }

  /// Set configuration [kDebugMode]
  ProductEnvironment.general() {
    _config = kDebugMode ? DevEnv() : ProdEnv();
  }
  static late final ProductConfiguration _config;

  /// Product network base url getter
  static String get baseUrl => _config.baseUrl;

  /// Product key url getter
  static String get apiKey => _config.apiKey;
}

/// Get application environment items
enum AppEnvironmentItems {
  /// Network Url
  baseUrl,

  /// Custom key
  apiKey;

  /// AppEnvironments values
  String get value {
    try {
      switch (this) {
        case AppEnvironmentItems.baseUrl:
          return ProductEnvironment._config.baseUrl;
        case AppEnvironmentItems.apiKey:
          return ProductEnvironment._config.apiKey;
      }
    } catch (e) {
      throw Exception('AppEnvironment is not initialized');
    }
  }
}
