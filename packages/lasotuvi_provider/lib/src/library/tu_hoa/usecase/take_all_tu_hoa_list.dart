import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import '../repository/tu_hoa_list_repository.dart';

final takeAllTuHoaListProvider = Provider(
  (ref) => TakeAllTuHoaList(
    ref.read(tuHoaListRepositoryProvider),
  ),
);
