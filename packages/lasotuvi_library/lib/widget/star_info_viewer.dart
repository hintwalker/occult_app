part of lasotuvi_library;

class StarInfoViewer extends StatefulWidget {
  const StarInfoViewer(
    this.starName, {
    super.key,
    required this.themeData,
  });
  final String starName;
  final ThemeData themeData;

  @override
  State<StatefulWidget> createState() => _StarInfoViewerState();
}

class _StarInfoViewerState extends State<StarInfoViewer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: downloadStarInfo(widget.starName),
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
