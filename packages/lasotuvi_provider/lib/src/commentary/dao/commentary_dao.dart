import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../../database/local_database_provider.dart';

final commentaryDaoProvider = Provider.autoDispose<CommentaryDao>(
    (ref) => CommentaryDao(ref.read(localDatabaseProvider)));
