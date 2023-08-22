import 'package:lstv_firestore_cache/src/usecase/pull_single_doc.dart';

class PullLastCanceledSubscription extends PullSingleDoc {
  const PullLastCanceledSubscription({
    required super.cacheRepository,
    // required super.cloudRepository,
  });
}
