import 'dart:io';

import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/product/init/config/product_environment.dart';
import 'package:vexana/vexana.dart';

/// Product Network Manager class
final class ProductNetworkManager extends NetworkManager<EmptyModel> {
  /// Network construct
  ProductNetworkManager.base()
      : super(
          options: BaseOptions(
            baseUrl: AppEnvironmentItems.baseUrl.value,
          ),
        );

  ///Handle Error
  ///[onErrorStatus] is error status code [HttpStatus]
  void listenErrorState({required ValueChanged<int> onErrorStatus}) {
    interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          onErrorStatus(error.response?.statusCode ?? HttpStatus.notFound);
          return handler.next(error);
        },
      ),
    );
  }
}
