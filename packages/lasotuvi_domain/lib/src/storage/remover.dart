import 'package:lasotuvi_domain/src/chart/usecase/delete_avatar_from_cloud.dart';

import '../chart/entity/chart.dart';
import '../chart/usecase/delete_chart_from_cloud.dart';
import '../chart/usecase/delete_chart_from_local.dart';
import '../note/entity/note.dart';
import '../note/usecase/delete_note_from_cloud.dart';
import '../note/usecase/delete_note_from_local.dart';
import '../tag/entity/tag.dart';
import '../tag/usecase/delete_tag_from_cloud.dart';
import '../tag/usecase/delete_tag_from_local.dart';

class Remover {
  final DeleteChartFromLocal deleteChartFromLocal;
  final DeleteChartFromCloud deleteChartFromCloud;
  final DeleteTagFromLocal deleteTagFromLocal;
  final DeleteTagFromCloud deleteTagFromCloud;
  final DeleteNoteFromLocal deleteNoteFromLocal;
  final DeleteNoteFromCloud deleteNoteFromCloud;
  final DeleteAvatarFromCloud deleteAvatarFromCloud;

  const Remover({
    required this.deleteChartFromLocal,
    required this.deleteChartFromCloud,
    required this.deleteNoteFromLocal,
    required this.deleteNoteFromCloud,
    required this.deleteTagFromLocal,
    required this.deleteTagFromCloud,
    required this.deleteAvatarFromCloud,
  });
  Future<void> deleteFromLocal<T>({required Iterable<T> items}) async {
    if (T == Chart) {
      for (var i = 0; i < items.length; i++) {
        final item = items.elementAt(i) as Chart;
        await deleteChartFromLocal(item);
      }
    } else if (T == Tag) {
      for (var i = 0; i < items.length; i++) {
        await deleteTagFromLocal(items.elementAt(i) as Tag);
      }
    } else if (T == Note) {
      for (var i = 0; i < items.length; i++) {
        await deleteNoteFromLocal(items.elementAt(i) as Note);
      }
    }
  }

  Future<void> deleteFromCloud<T>(
      {required String uid, required Iterable<T> items}) async {
    if (T == Chart) {
      for (var i = 0; i < items.length; i++) {
        final item = items.elementAt(i) as Chart;
        await deleteChartFromCloud(uid, item);
        if (!(item.avatar == null || item.avatar!.isEmpty)) {
          await deleteAvatarFromCloud(uid, item.avatar!.split('/').last);
        }
      }
    } else if (T == Tag) {
      for (var i = 0; i < items.length; i++) {
        await deleteTagFromCloud(uid, items.elementAt(i) as Tag);
      }
    } else if (T == Note) {
      for (var i = 0; i < items.length; i++) {
        await deleteNoteFromCloud(uid, items.elementAt(i) as Note);
      }
    }
  }

  Future<void> deleteForever<T>(
      {required String uid, required Iterable<T> items}) async {
    if (T == Chart) {
      for (var i = 0; i < items.length; i++) {
        await deleteChartFromCloud(uid, items.elementAt(i) as Chart);
        await deleteChartFromLocal(items.elementAt(i) as Chart);
      }
    } else if (T == Tag) {
      for (var i = 0; i < items.length; i++) {
        await deleteTagFromCloud(uid, items.elementAt(i) as Tag);
        await deleteTagFromLocal(items.elementAt(i) as Tag);
      }
    } else if (T == Note) {
      for (var i = 0; i < items.length; i++) {
        await deleteNoteFromCloud(uid, items.elementAt(i) as Note);
        await deleteNoteFromLocal(items.elementAt(i) as Note);
      }
    }
  }
}
