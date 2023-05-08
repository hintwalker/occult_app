part of tauari_data_core;

abstract class CloudStorable implements Dumpable, Entity {
  Map<String, Object?> toCloud();

  String get docId;
}
