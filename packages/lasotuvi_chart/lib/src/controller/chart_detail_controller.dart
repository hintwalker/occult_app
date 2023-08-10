import 'package:lasotuvi_domain/lasotuvi_domain.dart';

// class ChartDetailController extends SyncableDataStreamController<Chart> {
//   ChartDetailController({required super.onSyncableData});
// }

class ChartDetailController {
  ChartDetailController(this.takeData);
  final TakeChart takeData;

  Future<Chart?> takeById({
    required String? uid,
    required int id,
    required String? syncStatus,
  }) =>
      takeData.call(
        uid: uid,
        entityId: id,
        syncStatus: syncStatus,
      );
  // StreamSubscription<Chart?>? _subscription;
  // StreamController<Chart?>? _streamController;
  // Stream<Chart?> stream({
  //   required String? uid,
  //   required int docId,
  //   required String? syncStatus,
  // }) {
  //   _streamController = StreamController<Chart?>.broadcast();
  //   listen(
  //     uid: uid,
  //     docId: docId,
  //     syncStatus: syncStatus,
  //   );
  //   return _streamController!.stream;
  // }

  // void listen({
  //   required String? uid,
  //   required int docId,
  //   required String? syncStatus,
  // }) {
  //   _subscription = onData
  //       .call(
  //     uid: uid,
  //     docId: docId,
  //     syncStatus: syncStatus,
  //   )
  //       .listen((event) {
  //     if (!(_streamController == null || _streamController!.isClosed)) {
  //       _streamController?.add(event);
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   _subscription?.cancel();
  //   _streamController?.close();
  //   super.dispose();
  // }
}
