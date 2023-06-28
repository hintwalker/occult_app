part of lasotuvi_domain;

abstract class NoteAndChartRepository
    extends SyncableDependentRepository<Note, Chart> {
  NoteAndChartRepository(
      {required super.localRepository, required super.cloudRepository});
}
