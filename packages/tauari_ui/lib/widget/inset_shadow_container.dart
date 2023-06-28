part of tauari_ui;

class InsetShadowContainer extends StatelessWidget {
  const InsetShadowContainer({
    super.key,
    required this.color,
    required this.borderRadius,
    this.child,
  });
  final Color color;
  final Widget? child;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: inset.BoxDecoration(
        borderRadius: borderRadius,
        color: color,
        boxShadow: const [
          inset.BoxShadow(
            offset: Offset(-20, -20),
            blurRadius: 60,
            color: Colors.white,
            inset: true,
          ),
          inset.BoxShadow(
            offset: Offset(20, 20),
            blurRadius: 60,
            color: Color(0xFFBEBEBE),
            inset: true,
          ),
        ],
      ),
      child: child,
    );
  }
}
