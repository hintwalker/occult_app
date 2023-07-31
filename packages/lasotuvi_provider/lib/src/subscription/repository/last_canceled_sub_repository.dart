import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_source/last_canceled_sub_data_source.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

final lastCanceledSubRepositoryProvider =
    Provider.autoDispose<LastCanceledSubscriptionRepository>(
  (ref) => LastCanceledSubscriptionRepositoryImpl(
    ref.read(lastCanceledSubDataSourceProvider),
  ),
);
