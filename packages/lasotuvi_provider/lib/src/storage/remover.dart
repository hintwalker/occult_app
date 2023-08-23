import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/src/chart_tag/usecase/refresh_chart_tag_cloud.dart';

import '../chart/usecase/delete_avatar_from_cloud.dart';
import '../chart/usecase/delete_chart_from_cloud.dart';
import '../chart/usecase/delete_chart_from_local.dart';
import '../chart/usecase/refresh_chart_cloud.dart';
import '../note/usecase/delete_note_from_cloud.dart';
import '../note/usecase/delete_note_from_local.dart';
import '../note/usecase/refresh_note_cloud.dart';
import '../tag/usecase/delete_tag_from_cloud.dart';
import '../tag/usecase/delete_tag_from_local.dart';
import '../tag/usecase/refresh_tag_cloud.dart';

final removerProvider = Provider(
  (ref) => Remover(
    deleteChartFromLocal: ref.read(deleteChartFromLocalProvider),
    deleteChartFromCloud: ref.read(deleteChartFromCloudProvider),
    deleteTagFromLocal: ref.read(deleteTagFromLocalProvider),
    deleteTagFromCloud: ref.read(deleteTagFromCloudProvider),
    deleteNoteFromLocal: ref.read(deleteNoteFromLocalProvider),
    deleteNoteFromCloud: ref.read(deleteNoteFromCloudProvider),
    deleteAvatarFromCloud: ref.read(deleteAvatarFromCloudProvider),
    refreshChartCloud: ref.read(refreshChartCloudProvider),
    refreshTagCloud: ref.read(refreshTagCloudProvider),
    refreshNoteCloud: ref.read(refreshNoteCloudProvider),
    refreshChartTagCloud: ref.read(refreshChartTagCloudProvider),
  ),
);
