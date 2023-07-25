part of 'tab_overlay_bloc.dart';

class TabOverlayState extends Equatable {
  final int tabIndex;
  final bool showTabBar;
  const TabOverlayState(this.tabIndex, this.showTabBar);

  @override
  List<Object> get props => [tabIndex, showTabBar];
}
