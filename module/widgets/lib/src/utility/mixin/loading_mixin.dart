import 'package:flutter/widgets.dart';

///Stateful Widget mixin to handle loading state
mixin LoadingMixin<T extends StatefulWidget> on State<T> {
  final ValueNotifier<bool> _isLoadingNotifier = ValueNotifier<bool>(false);

  /// Get loading value
  bool get isLoading => _isLoadingNotifier.value;

  /// Change loading state
  /// If user want to force, give a bool value
  void changeLoading({bool? isLoading}) {
    if (isLoading != null) {
      _isLoadingNotifier.value = isLoading;
    }
    _isLoadingNotifier.value = !_isLoadingNotifier.value;
  }
}
