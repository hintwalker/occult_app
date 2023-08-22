import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import '../../utils/check_network_status.dart';
import '../service/subscription_list_firestore_service.dart';

final subscriptionListFirestoreDataSourceProvider =
    Provider.autoDispose<SubscriptionListCloudDataSource>(
        (ref) => SubscriptionListFirestoreDataSource(
              ref.watch(subscriptionListFirestoreServiceProvider),
              availableNetwork: ref.read(checkNetworkStatusProvider).call,
            ));
