import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import 'controller/wrap_tag_list_controller.dart';

class WrapTagListWidget extends StatefulWidget {
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
  State<StatefulWidget> createState() => _WrapTagListState();
}

class _WrapTagListState extends State<WrapTagListWidget> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listenToController);
  }

  void listenToController() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.controller.removeListener(listenToController);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 2.0,
      runSpacing: 2.0,
      children: widget.tags.map((e) => widget.itemBuilder(e)).toList(),
    );
  }
}
