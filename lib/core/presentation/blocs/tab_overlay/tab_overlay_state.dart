part of 'tab_overlay_bloc.dart';

class TabOverlayState extends Equatable {
  final PersistentTabController tabController;
  const TabOverlayState(this.tabController);

  void changeTabIndex(int index) {
    tabController.index = index;
  }

  @override
  List<Object> get props => [tabController];
}

class TabOverlayShown extends TabOverlayState {
  const TabOverlayShown(super.tabController);
}

class TabOverlayHidden extends TabOverlayState {
  const TabOverlayHidden(super.tabController);
}
