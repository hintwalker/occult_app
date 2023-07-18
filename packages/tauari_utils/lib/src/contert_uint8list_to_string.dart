import 'dart:convert';
import 'dart:typed_data';

String convertUint8ListToString(Uint8List? value) {
  if (value == null) {
    return '';
  }
  final stringData = const Utf8Decoder().convert(value);
  return stringData;
}
