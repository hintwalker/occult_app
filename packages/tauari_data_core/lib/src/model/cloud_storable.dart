import '../entity/cloud_getable.dart';

abstract class CloudStorable implements CloudGetable {
  Map<String, Object?> toCloud();
}
