import 'package:tauari_data_core/tauari_data_core.dart';

import '../repository/commentary_repository.dart';

class OnCommentaryCount extends OnCountEveryWhere<CommentaryRepository> {
  const OnCommentaryCount(super.repository);
}
