import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import 'package:lasotuvi_provider/src/library/data_source/star_list_data_source.dart';

final starListRepositoryProvider = Provider.autoDispose<StarListRepository>(
  (ref) => StarListRepository(
    ref.read(
      starListDataSourceProvider,
    ),
  ),
);
