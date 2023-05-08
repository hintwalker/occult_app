part of tauari_data_core;

abstract class ModelBase implements Dumpable {
  const ModelBase();
  T toEntity<T>();
  // final int id;
  // E toEntity();
  // Map<String, Object?> toFirestore();
  // Map<String, Object?> toMap();
}
