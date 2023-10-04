part of 'dates_bloc.dart';

abstract class DatesState extends Equatable {
  final List<DatesModel> dates;
  final DatesFilterModel filter;

  const DatesState({required this.dates, required this.filter});

  @override
  List<Object> get props => [dates, filter];
}

class DatesInitial extends DatesState {
  const DatesInitial({required super.dates, required super.filter});
}

class DatesLoading extends DatesState {
  const DatesLoading({required super.dates, required super.filter});
}

class DatesSuccess extends DatesState {
  const DatesSuccess({required super.dates, required super.filter});
}

class DatesError extends DatesState {
  final String message;
  const DatesError(
      {required this.message, required super.dates, required super.filter});

  @override
  List<Object> get props => [message, dates, filter];
}
