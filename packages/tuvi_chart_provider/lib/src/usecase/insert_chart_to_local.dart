import 'package:riverpod/riverpod.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';
import '../repository/chart_local_repository.dart';

final insertChartToLocalProvider = Provider.autoDispose<InsertChartToLocal>(
  (ref) => InsertChartToLocal(ref.read(chartLocalRepositoryProvider)),
);
