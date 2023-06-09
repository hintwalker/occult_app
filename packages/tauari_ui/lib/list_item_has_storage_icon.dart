part of tauari_ui;

class ListItemHasStorageIcon<T> extends StatelessWidget {
  const ListItemHasStorageIcon({
    super.key,
    this.uid,
    this.onCloud,
    required this.syncData,
    required this.colorScheme,
    required this.storageOptionsModalBuilder,
    this.itemPadding = const EdgeInsets.only(top: 8.0),
    required this.child,
  });
  final String? uid;
  final T syncData;
  final String? onCloud;
  final Widget Function(T, {String? uid, String? onCloud})
      storageOptionsModalBuilder;
  final ColorScheme colorScheme;
  final EdgeInsetsGeometry itemPadding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: itemPadding,
          child: child,
        ),
        Positioned(
          child: StorageIconButton(
            item: syncData,
            onCloud: onCloud,
            uid: uid,
            storageOptionsModalBuilder: storageOptionsModalBuilder,
            colorScheme: colorScheme,
            padding: const EdgeInsets.all(8.0),
          ),
        )
      ],
    );
  }
}
