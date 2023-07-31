import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/last_canceled_sub_repository.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

final updateLastCanceledSubscriptionProvider =
    Provider<UpdateLastCanceledSubscription>((ref) =>
        UpdateLastCanceledSubscription(ref.read(lastCanceledSubRepositoryProvider,),),);
