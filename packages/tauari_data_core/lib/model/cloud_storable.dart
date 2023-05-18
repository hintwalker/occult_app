part of tauari_data_core;

abstract class CloudStorable implements CloudGetable {
  Map<String, Object?> toCloud();
}
