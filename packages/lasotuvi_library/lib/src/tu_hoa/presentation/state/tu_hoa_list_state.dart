import 'package:equatable/equatable.dart';
import 'package:lasotuvi_library/src/tu_hoa/domain/entity/tu_hoa.dart';

enum TuHoaListWorkingState { initial, loading, success, failure }

class TuHoaListState extends Equatable {
  const TuHoaListState({
    required this.workingState,
    required this.data,
  });
  final TuHoaListWorkingState workingState;
  final Iterable<TuHoa> data;

  const TuHoaListState.initial({
    this.workingState = TuHoaListWorkingState.initial,
    this.data = const [],
  });

  TuHoaListState copyWith({
    TuHoaListWorkingState? workingState,
    Iterable<TuHoa>? data,
  }) =>
      TuHoaListState(
        workingState: workingState ?? this.workingState,
        data: data ?? this.data,
      );

  @override
  List<Object?> get props => [workingState, data];
}
