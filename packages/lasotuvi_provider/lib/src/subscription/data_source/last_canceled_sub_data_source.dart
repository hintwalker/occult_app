import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../../cloud_service/firestore_service_provider.dart';

final lastCanceledSubDataSourceProvider =
    Provider.autoDispose<FirebaseLastCanceledSubDataSource>((ref) =>
        FirebaseLastCanceledSubDataSource(ref.read(firestoreServiceProvider)));
