part of tauari_data_core;

abstract class Model<E> implements Dumpable {
  const Model();
  // final int id;
  E toEntity();
  // Map<String, Object?> toFirestore();
  // Map<String, Object?> toMap();
}
