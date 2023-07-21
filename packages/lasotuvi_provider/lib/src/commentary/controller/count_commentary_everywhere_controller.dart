import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_commentary_shared/lasotuvi_commentary_shared.dart';
import '../usecase/on_count_commentary.dart';

final countCommentaryEveryWhereControllerProvider =
    ChangeNotifierProvider.autoDispose<CountCommentaryEveryWhereController>(
  (ref) => CountCommentaryEveryWhereController(
    ref.read(onCountCommentaryProvider),
  ),
);
