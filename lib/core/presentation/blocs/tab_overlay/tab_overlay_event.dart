part of 'tab_overlay_bloc.dart';

abstract class TabOverlayEvent extends Equatable {
  const TabOverlayEvent();

  @override
  List<Object> get props => [];
}

class ChangeTabIndexEvent extends TabOverlayEvent {
  final int tabIndex;

  const ChangeTabIndexEvent(this.tabIndex);

  @override
  List<Object> get props => [tabIndex];
}

class HideNavTabEvent extends TabOverlayEvent {}

class ShowNavTabEvent extends TabOverlayEvent {}
