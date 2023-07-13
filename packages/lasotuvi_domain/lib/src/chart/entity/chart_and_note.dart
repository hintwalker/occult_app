import 'package:tauari_data_core/tauari_data_core.dart';

import '../../note/entity/note.dart';
import 'chart.dart';

class ChartAndNote extends SyncableEntityPair<Chart, Note> {
  ChartAndNote(super.entity1, super.entity2);

  @override
  operator ==(Object? other) =>
      identical(other, this) ||
      other.runtimeType == runtimeType &&
          other is ChartAndNote &&
          other.entity1 == entity1 &&
          other.entity2 == entity2;

  @override
  int get hashCode => Object.hashAll([entity1, entity2]);
}
