import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_mode_event.dart';
part 'theme_mode_state.dart';

class ThemeModeBloc extends Bloc<ThemeModeEvent, ThemeModeState> {
  ThemeModeBloc() : super(ThemeModeLight()) {
    on<SetThemeEvent>((event, emit) {
      if (event.themeMode == ThemeMode.dark) {
        emit(ThemeModeDark());
      } else {
        emit(ThemeModeLight());
      }
    });

    on<ToggleThemeEvent>((event, emit) {
      if (state is ThemeModeLight) {
        emit(ThemeModeDark());
      } else {
        emit(ThemeModeLight());
      }
    });
  }
}
