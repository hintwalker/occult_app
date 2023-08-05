import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

abstract class ChartRepository extends SyncableRepository<Chart> {
  ChartRepository(
      {required super.localRepository, required super.cloudRepository});
  Future<void> uploadAvatar(
    String uid,
    String localFilePath,
  );

  Future<void> deleteAvatarFromCloud(String uid, String filePath);
  Future<void> downloadAvatar(String uid, String localFilePath);
}
