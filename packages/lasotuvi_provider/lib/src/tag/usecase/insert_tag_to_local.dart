import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/local_tag_repository.dart';

final insertTagToLocalProvider = Provider.autoDispose<InsertTagToLocal>(
  (ref) => InsertTagToLocal(ref.read(localTagRepositoryProvider)),
);
