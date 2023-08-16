import 'package:equatable/equatable.dart';

enum ManualWorkingState {
  initial,
  loading,
  loaded,
  failure,
}

class ManualState extends Equatable {
  const ManualState({
    required this.content,
    required this.workingState,
  });
  final ManualWorkingState workingState;
  final String content;

  const ManualState.initial({
    this.content = '',
    this.workingState = ManualWorkingState.initial,
  });

  ManualState copyWith({
    ManualWorkingState? workingState,
    String? content,
  }) =>
      ManualState(
        content: content ?? this.content,
        workingState: workingState ?? this.workingState,
      );

  @override
  List<Object?> get props => [content];
}
