part of tauari_data_core;

abstract class LocalModel<T> extends ModelBase implements SqliteStorable {
  const LocalModel();
  // T toEntity();
  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is LocalModel &&
          runtimeType == other.runtimeType &&
          other.primaryKey == primaryKey;

  @override
  int get hashCode => primaryKey.hashCode;
}
