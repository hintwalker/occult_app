import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

enum ChartListWorkingState {
  initial,
  loading,
  loaded,
  failure,
}

class ChartListState extends Equatable {
  const ChartListState({
    required this.workingState,
    required this.data,
    required this.listkey,
  });
  final ChartListWorkingState workingState;
  final List<ChartHasTags> data;
  final GlobalKey<AnimatedListState>? listkey;

  const ChartListState.initial({
    this.workingState = ChartListWorkingState.initial,
    this.data = const [],
    this.listkey,
  });

  ChartListState copyWith({
    ChartListWorkingState? workingState,
    List<ChartHasTags>? data,
  }) =>
      ChartListState(
        workingState: workingState ?? this.workingState,
        data: data ?? this.data,
        listkey: listkey,
      );
  @override
  List<Object?> get props => [workingState];
}
