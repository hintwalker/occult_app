import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/commentary.dart';
import '../repository/local_commentary_repository.dart';

class InsertCommentaryToLocal
    extends InsertToLocal<Commentary, LocalCommentaryRepository> {
  InsertCommentaryToLocal(super.repository);
}
