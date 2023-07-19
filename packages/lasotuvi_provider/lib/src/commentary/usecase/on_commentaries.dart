import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/commentary_repostiory.dart';

final onCommentariesProvider = Provider.autoDispose<OnCommentaries>(
  (ref) => OnCommentaries(ref.read(commentaryRepositoryProvider)),
);
