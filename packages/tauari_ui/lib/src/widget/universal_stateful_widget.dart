import 'package:flutter/material.dart';

abstract class UniversalStatefulWidget extends StatefulWidget {
  const UniversalStatefulWidget({
    super.key,
    required this.translate,
  });
  final String Function(String) translate;
}
