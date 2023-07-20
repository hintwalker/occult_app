import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../../cloud_service/firestore_service_provider.dart';

final firebaseRequestDataSourceProvider =
    Provider.autoDispose<FirebaseRequestDataSource>(
  (ref) => FirebaseRequestDataSource(ref.read(firestoreServiceProvider)),
);
