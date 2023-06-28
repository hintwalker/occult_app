part of tauari_ui;

class SyncableDataManipulateController<E extends SyncableEntity,
    R extends SyncableRelRepository> extends ChangeNotifier {
  SyncableDataManipulateController({
    required this.newData,
  });
  final NewData<E, R> newData;
}
