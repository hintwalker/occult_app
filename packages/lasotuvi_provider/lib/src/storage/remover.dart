import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../chart/usecase/delete_avatar_from_cloud.dart';
import '../chart/usecase/delete_chart_from_cloud.dart';
import '../chart/usecase/delete_chart_from_local.dart';
import '../note/usecase/delete_note_from_cloud.dart';
import '../note/usecase/delete_note_from_local.dart';
import '../tag/usecase/delete_tag_from_cloud.dart';
import '../tag/usecase/delete_tag_from_local.dart';

final removerProvider = Provider((ref) => Remover(
      deleteChartFromLocal: ref.read(deleteChartFromLocalProvider),
      deleteChartFromCloud: ref.read(deleteChartFromCloudProvider),
      deleteTagFromLocal: ref.read(deleteTagFromLocalProvider),
      deleteTagFromCloud: ref.read(deleteTagFromCloudProvider),
      deleteNoteFromLocal: ref.read(deleteNoteFromLocalProvider),
      deleteNoteFromCloud: ref.read(deleteNoteFromCloudProvider),
      deleteAvatarFromCloud: ref.read(deleteAvatarFromCloudProvider),
    ));
