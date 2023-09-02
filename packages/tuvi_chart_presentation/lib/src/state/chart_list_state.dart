import 'package:equatable/equatable.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';

enum ChartListWorkingState { initial, loading, success, failure }

class ChartListState extends Equatable {
  const ChartListState({
    required this.data,
    required this.message,
    required this.workingState,
    required this.uid,
  });
  final ChartListWorkingState workingState;
  final String? message;
  final Iterable<Chart> data;
  final String? uid;

  const ChartListState.initial({
    this.data = const [],
    this.message,
    this.uid,
    this.workingState = ChartListWorkingState.initial,
  });

  ChartListState copyWith({
    ChartListWorkingState? workingState,
    String? message,
    Iterable<Chart>? data,
    String? uid,
  }) =>
      ChartListState(
        data: data ?? this.data,
        message: message ?? this.message,
        workingState: workingState ?? this.workingState,
        uid: uid ?? this.uid,
      );

  @override
  List<Object?> get props => [data, message, workingState, uid];
}
