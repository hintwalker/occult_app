import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

class DeleteNoteRangeOnCloud
    extends DeleteRangeOnCloud<Note, CloudNoteRepository> {
  DeleteNoteRangeOnCloud({
    required super.cacheRepository,
    // required super.cloudRepository,
  });
}
