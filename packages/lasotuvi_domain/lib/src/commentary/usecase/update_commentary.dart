import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/commentary.dart';
import '../repository/commentary_repository.dart';

class UpdateCommentary extends Update<Commentary, CommentaryRepository> {
  UpdateCommentary(super.repository);
}
