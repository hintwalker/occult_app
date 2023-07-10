import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../data_source/firebase_chart_data_source_provider.dart';

final cloudChartRepositoryProvider = Provider.autoDispose<CloudChartRepository>(
    (ref) =>
        CloudChartRepositoryImpl(ref.read(firebaseChartDataSourceProvider)));
