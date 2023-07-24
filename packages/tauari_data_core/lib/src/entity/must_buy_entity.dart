import 'package:tauari_data_core/tauari_data_core.dart';

abstract class MustBuyEntity<T> extends SyncableEntity<T> {
  MustBuyEntity(
    super.id, {
    required this.price,
    required this.paid,
    super.storageState,
    super.syncStatus,
    required super.modified,
  });
  final int price;
  final int paid;

  T copyWithPrice(int value);
  T copyWithPaid(int value);
}
