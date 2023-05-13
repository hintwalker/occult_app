part of lasotuvi_domain;

abstract class NoteRepository extends SyncableRepository<Note> {
  NoteRepository(
      {required super.localRepository, required super.cloudRepository});
}
