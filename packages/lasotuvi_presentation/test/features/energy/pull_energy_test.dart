import 'package:flutter_test/flutter_test.dart';
import 'package:lstv_test/lstv_test.dart';

void main() {
  setUpAll(() async {
    await setupThings();
  });
  test('should take energy from cache', () async {
    // final container = ProviderContainer();
    // addTearDown(container.dispose);
    // const listener = Listener();

    final energy = await takeCacheEnergyMock(testUid);

    expect(energy.value, 0);
  });

  test('should pull energy from Firestore', () async {
    await pullEnergyMock(testUid, refresh: true);
    final energy = await takeCacheEnergyMock(testUid);
    expect(energy.value, 10);
  });
}
