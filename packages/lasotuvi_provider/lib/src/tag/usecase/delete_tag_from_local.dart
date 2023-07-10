import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/local_tag_repository.dart';

final deleteTagFromLocalProvider = Provider.autoDispose<DeleteTagFromLocal>(
  (ref) => DeleteTagFromLocal(ref.read(localTagRepositoryProvider)),
);
