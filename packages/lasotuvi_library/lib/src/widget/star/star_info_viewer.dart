import 'package:flutter/material.dart';
import 'package:lasotuvi_library/src/controller/star_info_viewer_controller.dart';
import '../markdown_viewer.dart';

class StarInfoViewer extends StatefulWidget {
  const StarInfoViewer(
    this.starName, {
    super.key,
    required this.uid,
    required this.colorScheme,
    required this.controller,
  });
  final String uid;
  final String starName;
  final ColorScheme colorScheme;
  final StarInfoViewerController controller;

  @override
  State<StatefulWidget> createState() => _StarInfoViewerState();
}

class _StarInfoViewerState extends State<StarInfoViewer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.controller
            .download(uid: widget.uid, starName: widget.starName),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return MarkdownViewer(snapshot.requireData);
            // return Markdown(
            //   data: snapshot.requireData,
            //   styleSheet: MarkdownStyleSheet.fromTheme(themeData),
            //   styleSheetTheme: MarkdownStyleSheetBaseTheme.material,
            // );
          } else {
            return const Text('!');
          }
        });
  }
}
