part of 'tab_overlay_bloc.dart';

class TabOverlayState extends Equatable {
  final int tabIndex;
  final bool shown;
  const TabOverlayState({required this.tabIndex, required this.shown});

  @override
  List<Object> get props => [tabIndex, shown];
}
