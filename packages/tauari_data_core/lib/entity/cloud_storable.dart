part of tauari_data_core;

abstract class CloudStorable implements Dumpable, Entity, CloudGetable {
  Map<String, Object?> toCloud();
}
