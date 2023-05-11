part of tauari_data_core;

abstract class CloudModel<T> extends ModelBase implements CloudStorable {
  const CloudModel();
  T toEntity();

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is CloudModel &&
          runtimeType == other.runtimeType &&
          other.docId == docId;

  @override
  int get hashCode => docId.hashCode;
}
