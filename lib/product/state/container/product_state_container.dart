import 'package:get_it/get_it.dart';
import 'package:red_events_mobile_app_defult/product/service/manager/product_network_manager.dart';
import 'package:red_events_mobile_app_defult/product/state/view_model/product_view_model.dart';

/// Product container for dependency injection
final class ProductContainer {
  const ProductContainer._();
  static final _getIt = GetIt.I;

  /// Product core required items
  static void setup() {
    _getIt
      ..registerSingleton<ProductNetworkManager>(ProductNetworkManager.base())
      ..registerLazySingleton<ProductViewModel>(ProductViewModel.new);
  }

  /// Read for dependency container
  static T read<T extends Object>() => _getIt<T>();
}
