part of tuvi_chart_diagram;

Iterable<EndPoint> getEndPoints(int menhPos, double width, double height) {
  List<EndPoint> pointList = [];
  switch (menhPos) {
    case 0:
      final startX = width * 3 / 4;
      final startY = height;
      pointList.add(EndPoint(startX, startY, 0.0, height / 4.0));
      pointList.add(EndPoint(startX, startY, width / 4.0, 0.0));
      pointList.add(EndPoint(startX, startY, width, 0.0));
      break;
    case 1:
      final startX = width / 4.0;
      final startY = height;
      pointList.add(EndPoint(startX, startY, 0.0, 0.0));
      pointList.add(EndPoint(startX, startY, width * 3 / 4.0, 0.0));
      pointList.add(EndPoint(startX, startY, width, height / 4.0));
      break;
    case 2:
      const startX = 0.0;
      final startY = height;
      pointList.add(EndPoint(startX, startY, width / 4.0, 0.0));
      pointList.add(EndPoint(startX, startY, width, 0.0));
      pointList.add(EndPoint(startX, startY, width, height * 3 / 4.0));
      break;
    case 3:
      const startX = 0.0;
      final startY = height * 3 / 4;
      pointList.add(EndPoint(startX, startY, width * 3 / 4.0, 0.0));
      pointList.add(EndPoint(startX, startY, width, height / 4.0));
      pointList.add(EndPoint(startX, startY, width, height));
      break;
    case 4:
      const startX = 0.0;
      final startY = height / 4;
      pointList.add(EndPoint(startX, startY, width, 0.0));
      pointList.add(EndPoint(startX, startY, width, height * 3 / 4.0));
      pointList.add(EndPoint(startX, startY, width * 3 / 4, height));
      break;
    case 5:
      const startX = 0.0;
      const startY = 0.0;
      pointList.add(EndPoint(startX, startY, width, height / 4.0));
      pointList.add(EndPoint(startX, startY, width, height));
      pointList.add(EndPoint(startX, startY, width / 4, height));
      break;
    case 6:
      final startX = width / 4.0;
      const startY = 0.0;
      pointList.add(EndPoint(startX, startY, width, height * 3 / 4.0));
      pointList.add(EndPoint(startX, startY, width * 3 / 4, height));
      pointList.add(EndPoint(startX, startY, 0.0, height));
      break;
    case 7:
      final startX = width * 3 / 4.0;
      const startY = 0.0;
      pointList.add(EndPoint(startX, startY, width, height));
      pointList.add(EndPoint(startX, startY, width / 4, height));
      pointList.add(EndPoint(startX, startY, 0.0, height * 3 / 4));
      break;
    case 8:
      final startX = width;
      const startY = 0.0;
      pointList.add(EndPoint(startX, startY, width * 3 / 4, height));
      pointList.add(EndPoint(startX, startY, 0.0, height));
      pointList.add(EndPoint(startX, startY, 0.0, height / 4));
      break;
    case 9:
      final startX = width;
      final startY = height / 4.0;
      pointList.add(EndPoint(startX, startY, width / 4, height));
      pointList.add(EndPoint(startX, startY, 0.0, height * 3 / 4));
      pointList.add(EndPoint(startX, startY, 0.0, 0.0));
      break;
    case 10:
      final startX = width;
      final startY = height * 3 / 4.0;
      pointList.add(EndPoint(startX, startY, 0.0, height));
      pointList.add(EndPoint(startX, startY, 0.0, height / 4));
      pointList.add(EndPoint(startX, startY, width / 4, 0.0));
      break;
    case 11:
      final startX = width;
      final startY = height;
      pointList.add(EndPoint(startX, startY, 0.0, height * 3 / 4));
      pointList.add(EndPoint(startX, startY, 0.0, 0.0));
      pointList.add(EndPoint(startX, startY, width * 3 / 4, 0.0));
      break;

    default:
      break;
  }
  return pointList;
}
