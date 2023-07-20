import 'package:tauari_data_core/tauari_data_core.dart';

import '../../commentary/entity/commentary.dart';
import 'request.dart';

class RequestAndCommentary extends SyncableEntityPair<Request, Commentary> {
  RequestAndCommentary(super.entity1, super.entity2);

  @override
  operator ==(Object? other) =>
      identical(other, this) ||
      other.runtimeType == runtimeType &&
          other is RequestAndCommentary &&
          other.entity1 == entity1 &&
          other.entity2 == entity2;

  @override
  int get hashCode => Object.hashAll([entity1, entity2]);
}
