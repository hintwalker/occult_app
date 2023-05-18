part of tauari_data_core;

abstract class CloudModel<E> extends Model implements CloudStorable {
  const CloudModel();
  E toEntity();

  // @override
  // bool operator ==(Object? other) =>
  //     identical(this, other) ||
  //     other is CloudModel &&
  //         runtimeType == other.runtimeType &&
  //         other.docId == docId;

  // @override
  // int get hashCode => docId.hashCode;
}
