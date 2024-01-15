import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/product/service/manager/product_network_manager.dart';
import 'package:red_events_mobile_app_defult/product/state/container/product_state_items.dart';
import 'package:red_events_mobile_app_defult/product/state/view_model/product_view_model.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ProductNetworkManager get productNetworkManager =>
      ProductStateItems.productNetworkManager;

  ProductViewModel get productViewModel => ProductStateItems.productViewModel;

  TextTheme get textTheme => Theme.of(context).textTheme;
}
