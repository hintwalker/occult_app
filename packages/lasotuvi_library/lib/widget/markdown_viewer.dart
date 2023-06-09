part of lasotuvi_library;

class MarkdownViewer extends StatefulWidget {
  const MarkdownViewer(this.data, {super.key});
  final String data;

  @override
  State<MarkdownViewer> createState() => _MarkdownViewerState();
}

class _MarkdownViewerState extends State<MarkdownViewer> {
  final maxSize = 48;
  final minSize = 14;
  double textBodySize = 16;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MarkdownWidget(
          data: widget.data,
          shrinkWrap: true,
          selectable: false,
          padding:
              const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 126.0),
          config: MarkdownConfig.defaultConfig.copy(
              configs: [PConfig(textStyle: TextStyle(fontSize: textBodySize))]),
        ),
        Positioned(
            right: 12.0,
            bottom: 32.0,
            child: Row(
              children: [
                ElevatedButton.icon(
                    label: const Text(''),
                    onPressed: textBodySize == minSize
                        ? null
                        : () {
                            setState(() {
                              textBodySize--;
                            });
                          },
                    icon: const Icon(Icons.text_decrease),
                    style: IconButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0),
                              topRight: Radius.circular(2.0),
                              bottomRight: Radius.circular(2.0))),
                    )),
                const SizedBox(
                  width: 8.0,
                ),
                ElevatedButton.icon(
                    label: const Text(''),
                    onPressed: textBodySize == maxSize
                        ? null
                        : () {
                            setState(() {
                              textBodySize++;
                            });
                          },
                    icon: const Icon(Icons.text_increase),
                    style: IconButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(2.0),
                              bottomLeft: Radius.circular(2.0),
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0))),
                    ))
              ],
            ))
      ],
    );
  }
}
