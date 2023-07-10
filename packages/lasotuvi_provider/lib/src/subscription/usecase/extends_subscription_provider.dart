import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../repository/current_sub_repository_provider.dart';

final extendsSubscriptionProvider = Provider.autoDispose<ExtendsSubscription>(
    (ref) => ExtendsSubscription(
        currentSubscriptionRepository: ref.read(currentSubRepositoryProvider)));
