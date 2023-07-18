import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import '../../library/usecase/download_star_info.dart';

final starInfoViewerControllerProvider =
    ChangeNotifierProvider.autoDispose<StarInfoViewerController>(
  (ref) => StarInfoViewerController(
    ref.read(
      downloadStarInfoProvider,
    ),
  ),
);
