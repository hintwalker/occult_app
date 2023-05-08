part of tuvi_domain;

Can canOfHouse(HousePosition position, Can canOfBornYear) {
  final data = [
    [2, 4, 6, 8, 0, 2, 4, 6, 8, 0],
    [3, 5, 7, 9, 1, 3, 5, 7, 9, 1],
    [2, 4, 6, 8, 0, 2, 4, 6, 8, 0],
    [3, 5, 7, 9, 1, 3, 5, 7, 9, 1],
    [4, 6, 8, 0, 2, 4, 6, 8, 0, 2],
    [5, 7, 9, 1, 3, 5, 7, 9, 1, 3],
    [6, 8, 0, 2, 4, 6, 8, 0, 2, 4],
    [7, 9, 1, 3, 5, 7, 9, 1, 3, 5],
    [8, 0, 2, 4, 6, 8, 0, 2, 4, 6],
    [9, 1, 3, 5, 7, 9, 1, 3, 5, 7],
    [0, 2, 4, 6, 8, 0, 2, 4, 6, 8],
    [1, 3, 5, 7, 9, 1, 3, 5, 7, 9]
  ];
  final index = data[position.toInt()][canOfBornYear.index];
  return Can.fromIndex(index);
}
