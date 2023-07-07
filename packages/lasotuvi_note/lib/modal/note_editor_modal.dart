part of lasotuvi_note;

class NoteEditorModal extends StatelessWidget {
  const NoteEditorModal({
    super.key,
    required this.note,
    required this.colorScheme,
    required this.translate,
    required this.child,
    required this.chartAvatar,
  });

  final ColorScheme colorScheme;
  final String Function(String) translate;
  final Note note;
  final Widget child;
  final Widget Function(Note note) chartAvatar;

  @override
  Widget build(BuildContext context) {
    return
        // Material(
        //     child:
        SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     color: colorScheme.background,
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       const SizedBox(
          //         width: 8,
          //       ),
          //       IconButton(
          //           onPressed: () => Navigator.pop(context),
          //           icon: const Icon(Icons.arrow_back)),

          //       const SizedBox(
          //         width: 8,
          //       ),
          //       Expanded(
          //         child: Text(
          //           translate('note'),
          //           style: TextStyle(
          //               color: colorScheme.primary,
          //               fontWeight: FontWeight.bold,
          //               fontSize: 18),
          //           overflow: TextOverflow.ellipsis,
          //         ),
          //       ),
          //       const SizedBox(
          //         width: 8,
          //       ),
          //       // chartAvatar(note),
          //       const SizedBox(
          //         width: 8,
          //       ),
          //       // CircleHumanAvatar(
          //       //   gender: chart.gender.intValue,
          //       //   path: chart.avatar,
          //       // ),
          //     ],
          //   ),
          // ),
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.maybePop(context),
                icon: const Icon(Icons.arrow_back),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: chartAvatar(note),
              ),
            ],
          ),
          // Padding(
          //     padding: const EdgeInsets.only(
          //       left: 8,
          //       right: 8,
          //     ),
          //     child: Card(
          //         child: InkWell(
          //           onTap: (){},
          //           borderRadius: BorderRadius.circular(12.0),
          //             child: Padding(padding: const EdgeInsets.all(12.0),child: Row(
          //       children: [
          //         chartAvatar(note),
          //       ],
          //     ),),),),),
          Expanded(child: child),
        ],
      ),
      // ),
    );
  }
}
