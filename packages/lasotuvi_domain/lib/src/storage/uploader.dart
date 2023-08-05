import '../chart/entity/chart.dart';
import '../chart/usecase/upload_avatar.dart';
import '../chart/usecase/upload_chart.dart';
import '../note/entity/note.dart';
import '../note/usecase/upload_note.dart';
import '../tag/entity/tag.dart';
import '../tag/usecase/upload_tag.dart';

class Uploader {
  final UploadChart uploadChart;
  final UploadTag uploadTag;
  final UploadNote uploadNote;
  final UploadAvatar uploadAvatar;
  // final List<WorkProgressListener> listeners = [];
  Uploader({
    required this.uploadChart,
    required this.uploadTag,
    required this.uploadNote,
    required this.uploadAvatar,
  });
  // void addListener(WorkProgressListener listener, [int index = 0]) {
  //   listeners.insert(index, listener);
  // }

  Future<int> upload<T>(
      {required String uid, required Iterable<T> items}) async {
    if (T == Chart) {
      for (var i = 0; i < items.length; i++) {
        final item = items.elementAt(i) as Chart;
        await uploadChart(uid, item);
        if (!(item.avatar == null || item.avatar!.isEmpty)) {
          await uploadAvatar(uid, item.avatar!);
        }

        // for (var listener in listeners) {
        //   listener.listen(ProgressData(i + 1));
        // }
      }
    } else if (T == Tag) {
      for (var i = 0; i < items.length; i++) {
        await uploadTag(uid, items.elementAt(i) as Tag);
      }
    } else if (T == Note) {
      for (var i = 0; i < items.length; i++) {
        await uploadNote(uid, items.elementAt(i) as Note);
      }
    }
    return items.length;
  }
}
