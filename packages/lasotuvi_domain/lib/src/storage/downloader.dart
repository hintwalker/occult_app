import '../chart/entity/chart.dart';
import '../chart/usecase/download_avatar.dart';
import '../chart/usecase/download_chart.dart';
import '../note/entity/note.dart';
import '../note/usecase/download_note.dart';
import '../tag/entity/tag.dart';
import '../tag/usecase/download_tag.dart';

class Downloader {
  final DownloadChart downloadChart;
  final DownloadTag downloadTag;
  final DownloadNote downloadNote;
  final DownloadAvatar downloadAvatar;
  // final Iterable<WorkProgressListener>? listeners;
  const Downloader({
    required this.downloadChart,
    required this.downloadTag,
    required this.downloadNote,
    required this.downloadAvatar,
    // this.listeners,
  });
  Future<int> download<T>(
      {required String uid, required Iterable<T> items}) async {
    if (T == Chart) {
      for (var i = 0; i < items.length; i++) {
        final item = items.elementAt(i) as Chart;
        await downloadChart(
          uid,
          item,
        );
        if (!(item.avatar == null || item.avatar!.isEmpty)) {
          await downloadAvatar(uid, item.avatar!);
        }
      }
    } else if (T == Tag) {
      for (var i = 0; i < items.length; i++) {
        await downloadTag(uid, items.elementAt(i) as Tag);
      }
    } else if (T == Note) {
      for (var i = 0; i < items.length; i++) {
        await downloadNote(uid, items.elementAt(i) as Note);
      }
    }
    return items.length;
  }
}
