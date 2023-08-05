import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import 'package:lasotuvi_provider/src/library/usecase/load_star_info_from_local.dart';
import '../../library/usecase/download_star_info.dart';

final starInfoViewerControllerProvider =
    ChangeNotifierProvider.autoDispose<StarInfoViewerController>(
  (ref) => StarInfoViewerController(
    downloadStarInfo: ref.read(
      downloadStarInfoProvider,
    ),
    loadStarInfoFromLocal: ref.read(loadStarInfoFromLocalProvider),
  ),
);
