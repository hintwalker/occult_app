import 'package:lstv_firestore_cache/src/usecase/pull_single_doc.dart';

class PullCurrentSubscription extends PullSingleDoc {
  const PullCurrentSubscription({
    required super.cacheRepository,
    // required super.cloudRepository,
  });
}
