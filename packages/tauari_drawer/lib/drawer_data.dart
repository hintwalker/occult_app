part of tauari_drawer;

class DrawerData {
  const DrawerData({
    required this.id,
    required this.title,
    this.icon,
    this.image,
    this.trailing,
    this.isAssetsImage = false,
  });
  final String id;
  final String title;
  final Icon? icon;
  final String? image;
  final Widget? trailing;
  final bool isAssetsImage;

  @override
  operator ==(Object? other) =>
      identical(other, this) ||
      other is DrawerData && other.runtimeType == runtimeType && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
