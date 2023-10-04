import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'tab_overlay_event.dart';
part 'tab_overlay_state.dart';

class TabOverlayBloc extends Bloc<TabOverlayEvent, TabOverlayState> {
  TabOverlayBloc() : super(const TabOverlayState(tabIndex: 0, shown: false)) {
    on<ChangeTabIndexEvent>((event, emit) {
      emit(TabOverlayState(tabIndex: event.tabIndex, shown: state.shown));
    });
    on<ShowNavTabEvent>((event, emit) {
      emit(TabOverlayState(tabIndex: state.tabIndex, shown: true));
    });
    on<HideNavTabEvent>((event, emit) {
      emit(TabOverlayState(tabIndex: state.tabIndex, shown: false));
    });
  }
}
