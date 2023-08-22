import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../chart/usecase/upload_avatar.dart';
import '../chart/usecase/upload_chart.dart';
import '../tag/usecase/refresh_tag_cloud.dart';
import '../note/usecase/upload_note.dart';
import '../tag/usecase/upload_tag.dart';
import '../chart/usecase/refresh_chart_cloud.dart';
import '../note/usecase/refresh_note_cloud.dart';

final uploaderProvider = Provider<Uploader>(
  (ref) => Uploader(
    uploadChart: ref.read(uploadChartProvider),
    uploadTag: ref.read(uploadTagProvider),
    uploadNote: ref.read(
      uploadNoteProvider,
    ),
    uploadAvatar: ref.read(uploadAvatarProvider),
    refreshChartCloud: ref.read(refreshChartCloudProvider),
    refreshTagCloud: ref.read(refreshTagCloudProvider),
    refreshNoteCloud: ref.read(refreshNoteCloudProvider),
  ),
);
