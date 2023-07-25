part of 'theme_mode_bloc.dart';

abstract class ThemeModeState extends Equatable {
  const ThemeModeState();

  @override
  List<Object> get props => [];
}

class ThemeModeLight extends ThemeModeState {}

class ThemeModeDark extends ThemeModeState {}
