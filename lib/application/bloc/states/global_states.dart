import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

final class GlobalStates extends Equatable {
  const GlobalStates({
    this.themeMode = ThemeMode.system,
    this.locale = const Locale('en'),
  });

  final ThemeMode themeMode;
  final Locale locale;

  @override
  List<Object?> get props => [
        themeMode,
        locale,
      ];

  GlobalStates copyWith({
    ThemeMode? themeMode,
    Locale? locale,
  }) {
    return GlobalStates(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }
}
