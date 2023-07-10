import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../chart/usecase/upload_chart.dart';
import '../note/usecase/upload_note.dart';
import '../tag/usecase/upload_tag.dart';

final uploaderProvider = Provider<Uploader>((ref) => Uploader(
    uploadChart: ref.read(uploadChartProvider),
    uploadTag: ref.read(uploadTagProvider),
    uploadNote: ref.read(
      uploadNoteProvider,
    )));
