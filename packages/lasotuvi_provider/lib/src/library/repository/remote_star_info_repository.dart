import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import '../../library/data_source/remote_star_info_data_source.dart';

final remoteStarInfoRepository = Provider.autoDispose<RemoteStarInfoRepository>(
  (ref) => RemoteStarInfoRepository(
    ref.read(
      remoteStarInfoDataSourceProvider,
    ),
  ),
);
