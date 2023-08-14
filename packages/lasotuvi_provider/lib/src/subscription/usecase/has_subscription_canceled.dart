import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

final hasSubscriptionCanceledProvider =
    Provider((_) => HasSubscriptionCanceled());
