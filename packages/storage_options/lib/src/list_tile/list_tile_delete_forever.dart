import 'package:flutter/material.dart';

class ListTileDeleteForever extends StatelessWidget {
  const ListTileDeleteForever({
    super.key,
    required this.uid,
    required this.onTap,
    required this.colorScheme,
    required this.translate,
  });
  final void Function() onTap;
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final String? uid;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: uid == null ? colorScheme.secondary : colorScheme.error,
      textColor: uid == null ? colorScheme.secondary : colorScheme.error,
      leading: Icon(uid == null ? Icons.mobile_off : Icons.delete_forever),
      title:
          Text(translate(uid == null ? 'deleteFromDevice' : 'deleteForever')),
      onTap: onTap,
    );
  }
}
