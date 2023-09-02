import 'package:equatable/equatable.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

enum ChartGridWorkingState { initial, loading, success, failure }

class ChartGridState extends Equatable {
  const ChartGridState({
    required this.workingState,
    required this.currentSelectedSource,
    required this.options,
  });
  final ChartGridWorkingState workingState;
  final Map<String, dynamic>? options;
  final HousePosition currentSelectedSource;

  const ChartGridState.initial({
    this.workingState = ChartGridWorkingState.initial,
    this.currentSelectedSource = const HousePosition.initial(),
    this.options,
  });

  ChartGridState copyWith({
    ChartGridWorkingState? workingState,
    HousePosition? currentSelectedSource,
    Map<String, dynamic>? options,
    bool forceSetOptions = false,
  }) =>
      ChartGridState(
        workingState: workingState ?? this.workingState,
        currentSelectedSource:
            currentSelectedSource ?? this.currentSelectedSource,
        options: forceSetOptions ? options : options ?? this.options,
      );

  @override
  List<Object?> get props => [
        workingState,
        options,
        currentSelectedSource,
      ];
}
