import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'router_notifier.dart';

final routerNotifierProvider =
    AutoDisposeAsyncNotifierProvider<RouterNotifer, bool>(
  () => RouterNotifer(),
);
