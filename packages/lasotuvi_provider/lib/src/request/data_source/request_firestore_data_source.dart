import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import '../../utils/check_network_status.dart';
import '../service/request_firetore_service.dart';

final requestFirestoreDataSourceProvider =
    Provider.autoDispose<RequestCloudDataSource>(
  (ref) => RequestFirestoreDataSource(
    ref.read(requestFirestoreServiceProvider),
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
