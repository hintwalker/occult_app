part of '../../main.dart';

class AllStoragePlansScreen extends StatelessWidget {
  const AllStoragePlansScreen({
    super.key,
    this.restorationId,
  });
  final String? restorationId;

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
        restorationId: restorationId,
        child: const Column(
          children: [
            Placeholder(
              fallbackHeight: 50.0,
            ),
            Expanded(child: AllStoragePlansBody())
          ],
        ));
  }
}
