import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carys/features/home/data/models/dates_filter_model.dart';
import 'package:carys/features/home/data/models/dates_model.dart';
import 'package:equatable/equatable.dart';

part 'dates_event.dart';
part 'dates_state.dart';

class DatesBloc extends Bloc<DatesEvent, DatesState> {
  DatesBloc()
      : super(DatesInitial(dates: [], filter: DatesFilterModel.initial())) {
    on<GetDatesEvent>(getDatesEvent);
    on<ResetFilterEvent>(resetFilterEvent);
    on<FilterDatesEvent>(filterDatesEvent);
  }

  Future getDatesEvent(GetDatesEvent event, Emitter<DatesState> emit) async {
    emit(DatesLoading(dates: state.dates, filter: state.filter));
    await Future.delayed(const Duration(seconds: 1));
    emit(DatesSuccess(dates: DatesModel.all, filter: state.filter));
  }

  Future resetFilterEvent(
      ResetFilterEvent event, Emitter<DatesState> emit) async {
    emit(DatesSuccess(dates: state.dates, filter: DatesFilterModel.initial()));
  }

  Future filterDatesEvent(
      FilterDatesEvent event, Emitter<DatesState> emit) async {
    emit(DatesSuccess(dates: state.dates, filter: event.dateFilter));
  }
}
