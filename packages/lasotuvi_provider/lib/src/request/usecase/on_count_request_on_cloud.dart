import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';

final onCountRequestOnCloudProvider = Provider(
  (ref) => OnCountRequestOnCloud(
    ref.read(requestCloudCacheRepositoryProvider),
  ),
);
