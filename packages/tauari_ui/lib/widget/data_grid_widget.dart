part of tauari_ui;

class DataGridWidget<E> extends StatelessWidget {
  const DataGridWidget(
    this.data, {
    super.key,
    required this.itemWidget,
  });
  final Widget Function(E) itemWidget;
  final Iterable<E> data;
  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      // physics: const NeverScrollableScrollPhysics(),
      // shrinkWrap: true,
      axisDirection: AxisDirection.down,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 4.0,
      crossAxisCount: 2,
      children: List.generate(
        data.length,
        (index) => itemWidget(
          data.elementAt(index),
        ),
      ),
    );
  }
}
