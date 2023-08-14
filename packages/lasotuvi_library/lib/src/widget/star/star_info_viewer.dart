import 'package:flutter/material.dart';
import 'package:tauari_utils/tauari_utils.dart';
import '../../controller/star_info_viewer_controller.dart';
import 'package:tauari_ui/tauari_ui.dart';
import '../markdown_viewer.dart';

class StarInfoViewer extends StatefulWidget {
  const StarInfoViewer(
    this.starName, {
    super.key,
    required this.uid,
    required this.colorScheme,
    required this.controller,
    required this.translate,
  });
  final String uid;
  final String starName;
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final StarInfoViewerController controller;

  @override
  State<StatefulWidget> createState() => _StarInfoViewerState();
}

class _StarInfoViewerState extends State<StarInfoViewer> {
  bool? connected;

  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  void checkConnection() async {
    final result = await availableNetwork();
    setState(() {
      connected = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return connected == null
        ? const LoadingWidget()
        : connected == false
            ? BasicFutureBuilder(
                future: widget.controller.loadFromLocal(
                  uid: widget.uid,
                  starName: widget.starName,
                ),
                child: (data) => data == null || data.isEmpty
                    ? NoConnectionErrorText(
                        translate: widget.translate,
                        textColor: widget.colorScheme.error,
                      )
                    : MarkdownViewer(
                        data,
                        colorScheme: widget.colorScheme,
                      ))
            : BasicFutureBuilder(
                future: widget.controller
                    .download(uid: widget.uid, starName: widget.starName),
                child: (data) => data == null
                    ? DownloadFailedErrorText(
                        translate: widget.translate,
                        textColor: widget.colorScheme.error,
                      )
                    : MarkdownViewer(data, colorScheme: widget.colorScheme),
              );
    // return FutureBuilder(
    //     future: widget.controller
    //         .download(uid: widget.uid, starName: widget.starName),
    //     builder: (ctx, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(child: CircularProgressIndicator());
    //       } else if (snapshot.hasData) {
    //         return MarkdownViewer(snapshot.requireData);
    //         // return Markdown(
    //         //   data: snapshot.requireData,
    //         //   styleSheet: MarkdownStyleSheet.fromTheme(themeData),
    //         //   styleSheetTheme: MarkdownStyleSheetBaseTheme.material,
    //         // );
    //       } else {
    //         return const Text('!');
    //       }
    //     });
  }
}
