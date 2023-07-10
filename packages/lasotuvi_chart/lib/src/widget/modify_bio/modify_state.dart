import 'package:flutter/material.dart';

abstract class ModifyState<T, W extends StatefulWidget> extends State<W> {
  bool valid = true;
  T? value;
}
