import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../../cloud_service/firestore_service_provider.dart';

final firebaseTagDataSourceProvider =
    Provider.autoDispose<FirebaseTagDataSource>(
        (ref) => FirebaseTagDataSource(ref.read(firestoreServiceProvider)));
