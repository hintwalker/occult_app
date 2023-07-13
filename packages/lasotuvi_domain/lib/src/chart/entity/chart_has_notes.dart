import 'package:tauari_data_core/tauari_data_core.dart';

import '../../note/entity/note.dart';
import 'chart.dart';

class ChartHasNotes extends SyncableEntityCarrier<Chart, Note> {
  ChartHasNotes({required super.source, required super.carry});
  @override
  operator ==(Object? other) =>
      identical(other, this) ||
      other.runtimeType == runtimeType &&
          other is ChartHasNotes &&
          other.source == source;

  @override
  int get hashCode => source.hashCode;
}
