import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

final class ProductState extends Equatable {
  const ProductState({this.themeMode = ThemeMode.light});

  /// Product theme mode
  final ThemeMode themeMode;

  @override
  List<Object?> get props => [themeMode];

  /// Copy with
  ProductState copyWith({
    ThemeMode? themeMode,
    GlobalKey<ScaffoldMessengerState>? navigatorKey,
  }) {
    return ProductState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
