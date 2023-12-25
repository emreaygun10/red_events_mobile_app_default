import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

final class ProductState extends Equatable {
  const ProductState({this.themeMode = ThemeMode.light, this.navigatorKey});

  /// Product theme mode
  final ThemeMode themeMode;

  /// Flutter toast key
  final GlobalKey<ScaffoldMessengerState>? navigatorKey;

  @override
  List<Object?> get props => [themeMode, navigatorKey];

  /// Copy with
  ProductState copyWith({
    ThemeMode? themeMode,
    GlobalKey<ScaffoldMessengerState>? navigatorKey,
  }) {
    return ProductState(
      themeMode: themeMode ?? this.themeMode,
      navigatorKey: navigatorKey ?? this.navigatorKey,
    );
  }
}
