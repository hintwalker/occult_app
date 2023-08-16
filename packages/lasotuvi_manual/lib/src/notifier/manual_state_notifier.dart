import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_manual/src/state/manual_state.dart';

class ManualStateNotifier extends StateNotifier<ManualState> {
  ManualStateNotifier() : super(const ManualState.initial());

  Future<void> fetchData() async {
    state = state.copyWith(
      workingState: ManualWorkingState.loading,
    );
    final string = await rootBundle
        .loadString('packages/lasotuvi_manual/assets/manual_v1.2.0.md');
    state = state.copyWith(
      workingState: ManualWorkingState.loaded,
      content: string,
    );
  }
}

final manualStateNotifierProvider =
    StateNotifierProvider<ManualStateNotifier, ManualState>(
  (ref) => ManualStateNotifier(),
);
