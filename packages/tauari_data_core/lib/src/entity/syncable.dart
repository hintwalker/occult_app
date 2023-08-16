import 'modifyable.dart';
import 'sortable.dart';

abstract class Syncable<T> implements Sortable, Modifyable {
  T copyWithSyncStatus(String? value);
  String? get getSyncStatus;
  int get syncId;
  DateTime? get getUploadDate;
  T copyWithUploadDate(DateTime? value);
}
