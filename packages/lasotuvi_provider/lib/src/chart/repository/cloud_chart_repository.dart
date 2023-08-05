import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../data_source/firebase_chart_data_source.dart';

final cloudChartRepositoryProvider = Provider<CloudChartRepository>((ref) =>
    CloudChartRepositoryImpl(ref.watch(firebaseChartDataSourceProvider)));
