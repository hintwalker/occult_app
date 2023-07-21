import 'package:flutter/material.dart';
import 'package:lasotuvi_tag_shared/lasotuvi_tag_shared.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

class TagItemCardWidget extends StatelessWidget {
  const TagItemCardWidget(
    this.data, {
    super.key,
    required this.colorScheme,
    required this.translate,
    this.onTap,
    this.uid,
  });
  final Tag data;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function(BuildContext context, Tag tag, String? uid)? onTap;
  final String? uid;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap != null ? () => onTap!(context, data, uid) : null,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              HoriTagTitleWidget(data.title),
              HoriTagSubTitleWidget(data.subTitle),
            ],
          ),
        ),
      ),
    );
  }
}
