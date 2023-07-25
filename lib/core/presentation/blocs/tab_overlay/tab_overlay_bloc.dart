import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tab_overlay_event.dart';
part 'tab_overlay_state.dart';

class TabOverlayBloc extends Bloc<TabOverlayEvent, TabOverlayState> {
  TabOverlayBloc() : super(const TabOverlayState(0, true)) {
    on<ChangeTabIndexEvent>((event, emit) {
      emit(TabOverlayState(event.tabIndex, state.showTabBar));
    });
    on<ShowNavTabEvent>((event, emit) {
      emit(TabOverlayState(state.tabIndex, true));
    });
    on<HideNavTabEvent>((event, emit) {
      emit(TabOverlayState(state.tabIndex, false));
    });
  }
}
