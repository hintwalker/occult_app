part of '../../main.dart';

class ChartCreationScreen extends StatelessWidget {
  const ChartCreationScreen({
    super.key,
    this.restorationId,
  });
  final String? restorationId;

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
        restorationId: restorationId,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Chart creation'),
            backgroundColor: LasotuviAppStyle.colorScheme.background,
          ),
          body: const ChartCreationBody(),
          backgroundColor: LasotuviAppStyle.colorScheme.background,
        ));
  }
}
