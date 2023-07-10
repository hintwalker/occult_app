import 'package:flutter/material.dart';

import 'get_end_points.dart';

class LinesLayer extends CustomPainter {
  final int _menhPos;
  int get menhPos => _menhPos;
  LinesLayer(this._menhPos);
  @override
  void paint(Canvas canvas, Size size) {
    final points = getEndPoints(menhPos, size.width, size.height);
    final paint = Paint();
    paint.color = Colors.black.withOpacity(0.2);
    paint.strokeWidth = 1.0;
    for (var point in points) {
      canvas.drawLine(Offset(point.startX, point.startY),
          Offset(point.stopX, point.stopY), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
