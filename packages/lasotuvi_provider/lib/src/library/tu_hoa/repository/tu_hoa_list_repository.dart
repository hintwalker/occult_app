import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import 'package:lasotuvi_provider/src/library/tu_hoa/data_source/tu_hoa_list_data_source.dart';

final tuHoaListRepositoryProvider = Provider(
  (ref) => TuHoaListRepository(
    ref.read(tuHoaListDataSourceProvider),
  ),
);
