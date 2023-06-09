part of tauari_list_view;

class ActionButton<T> {
  const ActionButton({
    required this.onPressed,
    required this.background,
    required this.foreground,
    required this.icon,
    this.label,
  });
  final void Function(BuildContext, T) onPressed;
  final Color background;
  final Color foreground;
  final IconData icon;
  final String? label;
}
