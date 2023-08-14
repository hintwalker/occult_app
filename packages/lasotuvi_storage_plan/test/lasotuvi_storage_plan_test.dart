import 'package:flutter_test/flutter_test.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

void main() {
  test('should extends', () {
    final now = DateTime(2023, 1, 1, 1, 5);
    final date1 = DateTime(2023, 1, 1, 1, 0);
    final date2 = DateTime(2023, 1, 1, 1, 10);
    final result = !(now.isBefore(date1) || now.isAfter(date2));
    expect(result, true);
  });

  test('should extends subscription', () {
    final expiredDate = DateTime.now();
    final sub = Subscription.free().copyWith(expiredDate: expiredDate);
    final result = shouldExtendsSubscription(sub);
    expect(result, true);
  });
}
