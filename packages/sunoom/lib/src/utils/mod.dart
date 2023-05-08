part of sunoom;

int mod(int x, int y) {
  var z = x - (y * (x / y).floor()).toInt();
  if (z == 0) {
    z = y;
  }
  return z;
}
