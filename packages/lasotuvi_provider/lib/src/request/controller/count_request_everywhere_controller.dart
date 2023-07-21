import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_request_shared/lasotuvi_request_shared.dart';

import '../usecase/on_count_request.dart';

final countRequestEveryWhereControllerProvider =
    ChangeNotifierProvider.autoDispose<CountRequestEveryWhereController>(
  (ref) => CountRequestEveryWhereController(
    ref.read(onCountRequestProvider),
  ),
);
