import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../chart/usecase/download_avatar.dart';
import '../chart/usecase/download_chart.dart';
import '../note/usecase/download_note.dart';
import '../tag/usecase/download_tag.dart';

final downloaderProvider = Provider<Downloader>(
  (ref) => Downloader(
    downloadChart: ref.read(downloadChartProvider),
    downloadTag: ref.read(downloadTagProvider),
    downloadNote: ref.read(
      downloadNoteProvider,
    ),
    downloadAvatar: ref.read(
      downloadAvatarProvider,
    ),
  ),
);
