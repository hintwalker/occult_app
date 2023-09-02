import 'package:equatable/equatable.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

enum HouseWorkingState { initial, loading, success, failure }

class HouseState extends Equatable {
  const HouseState({
    required this.workingState,
    required this.selected,
    required this.source,
    required this.house,
  });
  final HouseWorkingState workingState;
  final bool selected;
  final bool source;
  final House house;

  const HouseState.initial({
    this.workingState = HouseWorkingState.initial,
    this.selected = false,
    this.source = false,
    this.house = const House.initial(),
  });

  HouseState copyWith({
    HouseWorkingState? workingState,
    bool? selected,
    bool? source,
    House? house,
  }) =>
      HouseState(
        workingState: workingState ?? this.workingState,
        selected: selected ?? this.selected,
        source: source ?? this.source,
        house: house ?? this.house,
      );
  @override
  List<Object?> get props => [
        workingState,
        selected,
        source,
      ];
}
