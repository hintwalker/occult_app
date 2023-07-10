import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';

import '../cloud_service/firestore_service_provider.dart';

final userDataSourceProvider = Provider.autoDispose<UserDataSource>(
    (ref) => UserDataSource(ref.read(firestoreServiceProvider)));
