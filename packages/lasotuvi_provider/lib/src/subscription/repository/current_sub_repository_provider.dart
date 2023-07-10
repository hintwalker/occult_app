import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../data_source/current_sub_data_source_provider.dart';

final currentSubRepositoryProvider = Provider.autoDispose<CurrentSubRepository>(
    (ref) => CurrentSubRepositoryImpl(ref.read(currentSubDataSourceProvider)));
