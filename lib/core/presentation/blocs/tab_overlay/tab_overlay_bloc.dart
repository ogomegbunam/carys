import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

part 'tab_overlay_event.dart';
part 'tab_overlay_state.dart';

class TabOverlayBloc extends Bloc<TabOverlayEvent, TabOverlayState> {
  TabOverlayBloc() : super(TabOverlayShown(PersistentTabController())) {
    on<ChangeTabIndexEvent>((event, emit) {
      emit(state..changeTabIndex(event.tabIndex));
    });
    on<ShowNavTabEvent>((event, emit) {
      emit(TabOverlayShown(state.tabController));
    });
    on<HideNavTabEvent>((event, emit) {
      emit(TabOverlayHidden(state.tabController));
    });
  }
}
