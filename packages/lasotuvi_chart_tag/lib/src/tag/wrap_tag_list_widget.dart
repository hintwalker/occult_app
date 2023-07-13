import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import 'controller/wrap_tag_list_controller.dart';

class WrapTagListWidget extends StatelessWidget {
  const WrapTagListWidget({
    super.key,
    required this.tags,
    required this.itemBuilder,
    required this.controller,
  });
  final Iterable<Tag> tags;
  final Widget Function(Tag) itemBuilder;
  final WrapTagListControler controller;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 2.0,
      runSpacing: 2.0,
      children: tags.map((e) => itemBuilder(e)).toList(),
    );
  }
}
