part of lasotuvi_data;

class NoteAndChartRepositoryImpl
    extends SyncableDependentRepositoryImpl<Note, NoteModel, Chart>
    implements NoteAndChartRepository {
  NoteAndChartRepositoryImpl(
      {required super.localDependentRepository,
      required super.cloudDependentRepository,
      required super.ownerRepository});
}
