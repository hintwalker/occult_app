import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_request/lasotuvi_request.dart';

import '../usecase/on_requests.dart';

final requestListControllerProvider =
    ChangeNotifierProvider.autoDispose<RequestListController>(
  (ref) => RequestListController(onRequests: ref.read(onRequestsProvider)),
);
