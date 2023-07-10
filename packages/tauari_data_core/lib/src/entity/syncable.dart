import 'sortable.dart';

abstract class Syncable<T> implements Sortable {
  T copyWithSyncStatus(String? value);
  String? get getSyncStatus;
}
