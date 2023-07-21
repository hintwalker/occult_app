import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

class NoteItemOwnerWidget extends StatelessWidget {
  const NoteItemOwnerWidget(this.owner, {super.key});
  final Chart owner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        CircleHumanAvatar(
          gender: owner.gender.intValue,
          size: 24.0,
          path: owner.avatar,
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
