import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/note_local_repository.dart';

final insertManyNotesToLocalProvider =
    Provider.autoDispose<InsertManyNotesToLocal>(
  (ref) => InsertManyNotesToLocal(ref.read(noteLocalRepositoryProvider)),
);
