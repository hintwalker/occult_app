import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/local_request_repository.dart';

final insertRequestToLocalProvider = Provider.autoDispose<InsertRequestToLocal>(
  (ref) => InsertRequestToLocal(ref.read(localRequestRepositoryProvider)),
);
