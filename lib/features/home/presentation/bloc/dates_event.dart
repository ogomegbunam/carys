part of 'dates_bloc.dart';

abstract class DatesEvent extends Equatable {
  const DatesEvent();

  @override
  List<Object> get props => [];
}

class GetDatesEvent extends DatesEvent {}

class ResetFilterEvent extends DatesEvent {}

class FilterDatesEvent extends DatesEvent {
  final DatesFilterModel dateFilter;

  const FilterDatesEvent(this.dateFilter);

  @override
  List<Object> get props => [dateFilter];
}
