import 'package:flutter/material.dart';

class LibraryItemWidget extends StatelessWidget {
  const LibraryItemWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.backgroundImage,
  });
  final String title;
  final void Function() onTap;
  final String backgroundImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  backgroundImage,
                  package: 'lasotuvi_library',
                ),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: GridTile(
                child: InkWell(
              borderRadius: BorderRadius.circular(12.0),
              onTap: onTap,
              // child: const Center(child: Text('')),
            )),
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
