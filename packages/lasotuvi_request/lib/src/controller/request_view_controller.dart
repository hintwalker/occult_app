import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

class RequestViewController extends ChangeNotifier {
  RequestViewController({
    required this.onRequestById,
    required this.onCommentary,
  });
  final OnRequestById onRequestById;
  final OnCommentaryByRequestId onCommentary;

  StreamSubscription<Request?>? _requestSubscription;
  StreamController<Request?>? _requestStreamController;

  Stream<Request?> stream({
    required String? uid,
    required int requestId,
    required String? syncStatus,
  }) {
    _requestStreamController = StreamController.broadcast();
    listen(
      uid: uid,
      requestId: requestId,
      syncStatus: syncStatus,
    );
    return _requestStreamController!.stream;
  }

  void listen({
    required String? uid,
    required int requestId,
    required String? syncStatus,
  }) {
    _requestSubscription = onRequestById
        .call(uid: uid, docId: requestId, syncStatus: syncStatus)
        .listen((event) {
      if (!(_requestStreamController == null ||
          _requestStreamController!.isClosed)) {
        _requestStreamController?.add(event);
      }
    });
  }

  @override
  void dispose() {
    _requestSubscription?.cancel();
    _requestStreamController?.close();

    super.dispose();
  }
}
