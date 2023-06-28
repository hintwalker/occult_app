part of tuvi_chart_diagram;

class ItemContainer extends StatelessWidget {
  const ItemContainer(this.child, {super.key, this.altBackgroundColor});
  final Widget? child;
  final Color? altBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: altBackgroundColor == null
          ? itemDecoration
          : itemDecoration.copyWith(color: altBackgroundColor),
      child: child != null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
              child: child,
            )
          : null,
    );
  }
}
