import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';

import '../state/chart_list_state.dart';

class ChartListNotifier extends StateNotifier<ChartListState> {
  ChartListNotifier({
    required this.onData,
  }) : super(const ChartListState.initial());
  final OnCharts onData;

  StreamSubscription<Iterable<Chart>>? _subscription;
  StreamController<Iterable<Chart>>? _streamController;

  Stream<Iterable<Chart>> streamData(String? uid, [QueryArgs? queryArgs]) {
    _streamController = StreamController<Iterable<Chart>>.broadcast();
    listen(uid, queryArgs);
    return _streamController!.stream;
  }

  void listen(String? uid, [QueryArgs? queryArgs]) {
    _subscription = onData(uid, queryArgs).listen((event) {
      if (queryArgs?.limitDisplay != null) {
        state = state.copyWith(
          data: event.take(queryArgs!.limitDisplay!),
          workingState: ChartListWorkingState.success,
        );
      } else {
        state = state.copyWith(
          data: event,
          workingState: ChartListWorkingState.success,
        );
      }

      if (!(_streamController == null || _streamController!.isClosed)) {
        if (queryArgs?.limitDisplay != null) {
          final list = event.take(queryArgs!.limitDisplay!);
          _streamController?.add(list);
        } else {
          _streamController?.add(event);
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
