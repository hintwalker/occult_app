import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/commentary_repostiory.dart';

final updateCommentaryProvider = Provider.autoDispose<UpdateCommentary>(
  (ref) => UpdateCommentary(
    ref.read(commentaryRepositoryProvider),
  ),
);
