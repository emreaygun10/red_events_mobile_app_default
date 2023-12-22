import 'package:red_events_mobile_app_defult/product/service/manager/product_network_manager.dart';
import 'package:red_events_mobile_app_defult/product/state/container/product_state_container.dart';
import 'package:red_events_mobile_app_defult/product/state/view_model/product_view_model.dart';

final class ProductStateItems {
  const ProductStateItems._();

  static ProductNetworkManager get productNetworkManager =>
      ProductContainer.read<ProductNetworkManager>();

  static ProductViewModel get productViewModel =>
      ProductContainer.read<ProductViewModel>();
}
