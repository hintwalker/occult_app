import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuvi_chart_diagram_v2/src/house/state/house_state.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

class HouseNotifier extends StateNotifier<HouseState> {
  HouseNotifier({
    required this.onSelectedByUser,
  }) : super(const HouseState.initial());
  void Function(House) onSelectedByUser;

  void selectByUser(bool selected) {
    state = state.copyWith(
      workingState: HouseWorkingState.success,
      selected: selected,
      source: true,
    );
    onSelectedByUser(state.house);
  }

  void clearSelected() {
    state = state.copyWith(
      workingState: HouseWorkingState.success,
      selected: false,
      source: false,
    );
  }

  void select(bool selected) {
    state = state.copyWith(
      workingState: HouseWorkingState.success,
      selected: selected,
      source: false,
    );
  }
}
