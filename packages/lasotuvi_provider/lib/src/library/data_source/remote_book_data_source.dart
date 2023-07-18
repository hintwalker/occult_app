import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import '../../cloud_service/firebase_storage_service.dart';

final remoteBookDataSourceProvider = Provider.autoDispose<RemoteBookDataSource>(
  (ref) => RemoteBookDataSource(
    ref.read(firebaseStorageServiceProvider),
  ),
);
