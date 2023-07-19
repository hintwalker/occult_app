import 'package:tauari_data_core/tauari_data_core.dart';

abstract class MustBuyModel<E extends MustBuyEntity> extends SyncableModel<E> {
  MustBuyModel(
    super.id, {
    super.storageState,
    super.syncStatus,
    required this.price,
    required this.paid,
  });
  final int price;
  final int paid;
}
