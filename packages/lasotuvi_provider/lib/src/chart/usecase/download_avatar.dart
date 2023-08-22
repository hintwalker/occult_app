import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';

final downloadAvatarProvider = Provider(
  (ref) => DownloadAvatar(
    ref.read(
      chartCacheRepositoryProvider,
    ),
  ),
);
