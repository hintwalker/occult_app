part of lasotuvi_note;

class NoteItemOwnerWidget extends StatelessWidget {
  const NoteItemOwnerWidget(this.owner, {super.key});
  final Chart owner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(children: [
        CircleHumanAvatar(
          gender: owner.gender.intValue,
          size: 22.0,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          owner.name,
          style: const TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
          overflow: TextOverflow.fade,
          maxLines: 1,
        )
      ]),
    );
  }
}
