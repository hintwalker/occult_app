import 'package:flutter/material.dart';

class ListTileDeleteFromLocal extends StatelessWidget {
  const ListTileDeleteFromLocal({
    super.key,
    required this.onTap,
    required this.translate,
  });
  final void Function() onTap;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.mobile_off),
      title: Text(translate('deleteFromLocal')),
      onTap: onTap,
    );
  }
}
