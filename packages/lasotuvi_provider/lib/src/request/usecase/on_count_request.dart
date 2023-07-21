import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/request_repository.dart';

final onCountRequestProvider = Provider(
  (ref) => OnCountRequest(
    ref.read(requestRepositoryProvider),
  ),
);
