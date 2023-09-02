import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuvi_chart_diagram_v2/src/house/notifier/house_notifier.dart';
import 'package:tuvi_domain/tuvi_domain.dart';
import '../state/chart_grid_state.dart';

class ChartGridNotifier extends StateNotifier<ChartGridState> {
  ChartGridNotifier() : super(const ChartGridState.initial());

  final Map<HousePosition, HouseNotifier> houseNotifiers = {};

  void insert(HousePosition position, HouseNotifier houseNotifier) =>
      houseNotifiers[position] = houseNotifier;

  void select(House house) {
    clearAllSelected();
    // HousePosition currentSelectedSource;
    if (state.currentSelectedSource != house.position) {
      // currentSelectedSource = house.position;
      // final HousePair pair = house.findPair();
      final HouseTriad triad = house.findTriad();
      final HousePair opposition = house.findOpposition();
      // houseNotifiers[house.position]?.selectByUser(true);
      // houseControllers[house.position]?.enableSelected();
      // houseControllers[house.position]?.enableSource();
      // selectPair(pair, true);
      selectTriad(triad, true);
      selectOpposition(opposition, true);
      state = state.copyWith(
        workingState: ChartGridWorkingState.success,
        currentSelectedSource: house.position,
      );
    } else {
      state = state.copyWith(
        workingState: ChartGridWorkingState.success,
        currentSelectedSource: HousePosition.unknown(),
      );
      // currentSelectedSource = HousePosition.unknown();
    }
  }

  void selectPair(HousePair pair, bool selected) {
    houseNotifiers[pair.other]?.select(selected);
  }

  void selectTriad(HouseTriad triad, bool selected) {
    houseNotifiers[triad.nextClockWise]?.select(selected);
    houseNotifiers[triad.other]?.select(selected);
  }

  void selectOpposition(HousePair opposition, bool selected) {
    houseNotifiers[opposition.other]?.select(selected);
  }

  void clearAllSelected() {
    houseNotifiers.forEach((key, value) {
      value.clearSelected();
    });
  }
}
