import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../data_source/firebase_tag_data_source.dart';

final cloudTagRepositoryProvider = Provider.autoDispose<CloudTagRepository>(
    (ref) => CloudTagRepositoryImpl(ref.read(firebaseTagDataSourceProvider)));
