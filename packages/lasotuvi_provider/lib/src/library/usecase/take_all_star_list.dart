import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import '../repository/star_list_repository.dart';

final takeAllStarListProvider = Provider.autoDispose<TakeAllStarList>(
  (ref) => TakeAllStarList(
    ref.read(starListRepositoryProvider),
  ),
);
