import 'package:flutter/material.dart';

class CloudItem extends StatelessWidget {
  const CloudItem({
    super.key,
    required this.title,
    required this.value,
    required this.maxValue,
    required this.colorScheme,
    required this.translate,
    this.leading,
  });
  final String title;
  final int value;
  final int maxValue;
  final ColorScheme colorScheme;
  final Widget? leading;
  final String Function(String) translate;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 20.0,
          ),
          if (leading != null) leading!,
          const SizedBox(
            width: 8.0,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            '$value/$maxValue',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: value < maxValue ? colorScheme.primary : colorScheme.error,
            ),
          ),
          const SizedBox(width: 8.0),
          SizedBox(
            width: 84,
            height: 20.0,
            // child: Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(16.0),
            //   ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: LinearProgressIndicator(
                value: maxValue != 0 ? value / maxValue : 0,
                color:
                    value < maxValue ? colorScheme.primary : colorScheme.error,
              ),
            ),
            // ),
          ),
        ],
      ),
      subtitle: value > maxValue
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 24,
                ),
                Text(
                  '${translate('vuotMuc')}: ${value - maxValue}',
                  style: TextStyle(
                    fontSize: 16,
                    color: colorScheme.error,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            )
          : null,
    );
  }
}
