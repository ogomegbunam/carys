part of 'theme_mode_bloc.dart';

abstract class ThemeModeEvent extends Equatable {
  const ThemeModeEvent();

  @override
  List<Object> get props => [];
}

class SetThemeEvent extends ThemeModeEvent {
  final ThemeMode themeMode;

  const SetThemeEvent(this.themeMode);

  @override
  List<Object> get props => [themeMode];
}

class ToggleThemeEvent extends ThemeModeEvent {}
