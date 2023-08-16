import 'package:equatable/equatable.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

enum NoteEditorWorkingState {
  initial,
  loading,
  loaded,
  failure,
}

class NoteEditorState extends Equatable {
  const NoteEditorState({
    required this.workingState,
    this.note,
    this.chart,
  });
  final NoteEditorWorkingState workingState;
  final Note? note;
  final Chart? chart;
  const NoteEditorState.initial({
    this.workingState = NoteEditorWorkingState.initial,
    this.note,
    this.chart,
  });
  NoteEditorState copyWith({
    NoteEditorWorkingState? workingState,
    Note? note,
    Chart? chart,
  }) =>
      NoteEditorState(
        workingState: workingState ?? this.workingState,
        note: note ?? this.note,
        chart: chart ?? this.chart,
      );
  @override
  List<Object?> get props => [
        workingState,
        note,
        chart,
      ];
}
