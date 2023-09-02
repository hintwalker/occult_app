import 'package:flutter/material.dart';

abstract class UniversalWidget extends StatelessWidget {
  const UniversalWidget({
    super.key,
    required this.translate,
  });
  final String Function(String) translate;
}
