import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/commentary.dart';
import '../repository/cloud_commentary_repository.dart';

class DeleteCommentaryFromCloud
    extends DeleteFromCloud<Commentary, CloudCommentaryRepository> {
  DeleteCommentaryFromCloud(super.repository);
}
