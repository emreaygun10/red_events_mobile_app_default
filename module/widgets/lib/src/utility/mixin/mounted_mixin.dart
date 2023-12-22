import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

///Stateful Widget mixin to mounted
mixin MountedMixin<T extends StatefulWidget> on State<T> {
  /// manage your mounted state
  Future<void> safeOperation(AsyncCallback callback) async {
    if (!mounted) return;
    await callback.call();
  }
}
