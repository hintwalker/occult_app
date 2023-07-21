import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

class RequestListController extends SyncableDataListStreamController<Request> {
  RequestListController({required OnRequests onRequests})
      : super(onSyncableData: onRequests);

  // final OnRequests onRequests;

  // StreamSubscription<Iterable<Request>>? _subscription;
  // StreamController<Iterable<Request>>? _streamController;

  // Stream<Iterable<Request>> requestsStream(String? uid, [QueryArgs? queryArgs]) {
  //   _streamController = StreamController<Iterable<Request>>.broadcast();
  //   listen(uid, queryArgs);
  //   return _streamController!.stream;
  // }

  // void listen(String? uid, [QueryArgs? queryArgs]) {
  //   _subscription = onRequests(uid, queryArgs).listen((event) {
  //     _streamController?.add(event);
  //   });
  // }

  // @override
  // void dispose() {
  //   _subscription?.cancel();
  //   _streamController?.close();
  //   super.dispose();
  // }
}
