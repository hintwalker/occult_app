import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/commentary.dart';
import '../repository/commentary_repository.dart';

class UploadCommentary extends Upload<Commentary, CommentaryRepository> {
  UploadCommentary(super.repository);
}
