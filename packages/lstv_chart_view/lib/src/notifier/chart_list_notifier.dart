import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lstv_chart_view/src/state/chart_list_state.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

class ChartListNotifier extends StateNotifier<ChartListState> {
  ChartListNotifier({
    required this.onSyncableData,
  }) : super(const ChartListState.initial());

  final OnChartHasTagsList onSyncableData;

  StreamSubscription<Iterable<ChartHasTags>>? _subscription;
  StreamController<Iterable<ChartHasTags>>? _streamController;

  Stream<Iterable<ChartHasTags>> fetchData(String? uid,
      [QueryArgs? queryArgs]) {
    _streamController = StreamController<Iterable<ChartHasTags>>.broadcast();
    listen(uid, queryArgs);
    return _streamController!.stream;
  }

  void listen(String? uid, [QueryArgs? queryArgs]) {
    _subscription = onSyncableData(uid, queryArgs).listen((event) {
      state = state.copyWith(workingState: ChartListWorkingState.loading);
      if (!(_streamController == null || _streamController!.isClosed)) {
        if (queryArgs?.limitDisplay != null) {
          final list = event.take(queryArgs!.limitDisplay!);
          _streamController?.add(list);
          // state.listkey?.currentState?.insertAllItems(index, length)
          state = state.copyWith(
            workingState: ChartListWorkingState.loaded,
            data: list.toList(),
          );
        } else {
          state = state.copyWith(
            workingState: ChartListWorkingState.loaded,
            data: event.toList(),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _streamController?.close();
    super.dispose();
  }
}
