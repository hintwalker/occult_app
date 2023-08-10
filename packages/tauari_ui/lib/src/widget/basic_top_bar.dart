import 'package:flutter/material.dart';

class BasicTopBar extends StatelessWidget {
  const BasicTopBar({
    super.key,
    required this.title,
    required this.colorScheme,
    this.actions,
    this.borderRadius = const BorderRadius.only(
      bottomLeft: Radius.circular(24),
      bottomRight: Radius.circular(24),
    ),
  });
  final ColorScheme colorScheme;
  final BorderRadiusGeometry borderRadius;
  final List<Widget>? actions;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: colorScheme.background,
            boxShadow: [
              BoxShadow(
                color: colorScheme.background,
                offset: const Offset(0, 0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ),
              BoxShadow(
                color: colorScheme.outline,
                offset: const Offset(2.0, 2.0),
                blurRadius: 1.0,
                spreadRadius: 0.2,
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 8,
            ),
            IconButton(
                onPressed: () => Navigator.maybePop(context),
                icon: const Icon(Icons.arrow_back)),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: title,
              // child: Text(
              //   title,
              //   style: TextStyle(
              //       color: colorScheme.primary,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 18),
              //   overflow: TextOverflow.ellipsis,
              // ),
            ),
            const SizedBox(
              width: 8,
            ),
            if (actions != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...actions!,
                  const SizedBox(
                    width: 8.0,
                  )
                ],
              )
          ],
        ));
  }
}
