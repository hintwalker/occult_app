import 'package:flutter/material.dart';

class TagItemInChart extends StatelessWidget {
  const TagItemInChart(this.title, {super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Text(
          title,
          style: const TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
