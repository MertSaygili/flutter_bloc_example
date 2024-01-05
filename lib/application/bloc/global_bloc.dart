import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/application/bloc/states/global_states.dart';

final class GlobalBloc extends Cubit<GlobalStates> {
  GlobalBloc() : super(const GlobalStates());

  void setThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }

  void setLocale(Locale locale) {
    emit(state.copyWith(locale: locale));
  }
}
