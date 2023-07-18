import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import '../../library/repository/remote_star_info_repository.dart';

final downloadStarInfoProvider = Provider.autoDispose<DownloadStarInfo>(
  (ref) => DownloadStarInfo(
    ref.read(
      remoteStarInfoRepository,
    ),
  ),
);
