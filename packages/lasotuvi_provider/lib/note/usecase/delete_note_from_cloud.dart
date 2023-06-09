part of lasotuvi_provider;

final deleteNoteFromCloudProvider = Provider.autoDispose<DeleteNoteFromCloud>(
  (ref) => DeleteNoteFromCloud(ref.read(cloudNoteRepositoryProvider)),
);
