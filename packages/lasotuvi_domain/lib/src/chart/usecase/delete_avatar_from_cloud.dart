import '../repository/chart_repository.dart';

class DeleteAvatarFromCloud {
  const DeleteAvatarFromCloud(this.chartRepository);
  final ChartRepository chartRepository;
  Future<void> call(String uid, String fileName) =>
      chartRepository.deleteAvatarFromCloud(uid, fileName);
}
