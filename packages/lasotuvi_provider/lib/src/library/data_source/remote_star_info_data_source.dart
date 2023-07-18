import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import '../../cloud_service/firebase_storage_service.dart';

final remoteStarInfoDataSourceProvider =
    Provider.autoDispose<RemoteStarInfoDataSource>(
  (ref) => RemoteStarInfoDataSource(
    ref.read(firebaseStorageServiceProvider),
  ),
);
