import 'package:flutter/material.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';

import '../../features/home/widget/data_creation_options_modal.dart';

class NewDataOptionButton extends StatelessWidget {
  const NewDataOptionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
            color: LasotuviAppStyle.colorScheme.primaryContainer,
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(44.0),
              bottomRight: Radius.circular(44.0),
            ),
            boxShadow: [
              BoxShadow(
                color: LasotuviAppStyle.colorScheme.outline,
                offset: const Offset(2.0, 2.0),
                spreadRadius: 1.0,
                blurRadius: 2.0,
              ),
              BoxShadow(
                color: LasotuviAppStyle.colorScheme.primaryContainer,
                // offset: const Offset(2.0, 2.0),
                // spreadRadius: 2.0,
                // blurRadius: 2.0,
              )
            ]),
        child: InkWell(
          onTap: () => showModalBottomSheet(
              context: context,
              builder: (context) => const DataCreationOptionsModal()),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(44.0),
            bottomRight: Radius.circular(44.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(
              onPressed: null,
              disabledColor: LasotuviAppStyle.colorScheme.primary,
              icon: const Icon(
                Icons.add,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
