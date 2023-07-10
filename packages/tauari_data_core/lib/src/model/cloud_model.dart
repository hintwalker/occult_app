import 'cloud_storable.dart';
import 'model.dart';

abstract class CloudModel<E> extends Model<E> implements CloudStorable {
  const CloudModel();
  // E toEntity();

  // @override
  // bool operator ==(Object? other) =>
  //     identical(this, other) ||
  //     other is CloudModel &&
  //         runtimeType == other.runtimeType &&
  //         other.docId == docId;

  // @override
  // int get hashCode => docId.hashCode;
}
