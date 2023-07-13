import 'package:tauari_data_core/tauari_data_core.dart';

import '../../chart/entity/chart.dart';
import '../../tag/entity/tag.dart';

class TagHasCharts extends SyncableEntityCarrier<Tag, Chart> {
  TagHasCharts({required super.source, required super.carry});

  @override
  operator ==(Object? other) =>
      identical(other, this) ||
      other.runtimeType == runtimeType &&
          other is TagHasCharts &&
          other.source == source;

  @override
  int get hashCode => source.hashCode;
}
