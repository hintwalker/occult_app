import 'package:flutter/material.dart';

class LibraryItemWidget extends StatelessWidget {
  const LibraryItemWidget({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: GridTile(
          child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: onTap,
        child: Center(child: Text(title)),
      )),
    );
  }
}
