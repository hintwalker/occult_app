import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';

import '../chart/usecase/insert_many_charts_to_local.dart';
import '../note/usecase/insert_many_notes_to_local.dart';
import '../tag/usecase/insert_many_tags_to_local.dart';

final migrateOldDataProvider = Provider(
  (ref) => MigrateOldData(
    insertChartsToLocal: ref.read(insertManyChartsToLocalProvider),
    insertNotesToLocal: ref.read(insertManyNotesToLocalProvider),
    insertTagsToLocal: ref.read(insertManyTagsToLocalProvider),
    insertChartTagsToLocal: ref.read(insertManyChartTagsToLocalProvider),
  ),
);
