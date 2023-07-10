import 'house_position.dart';

class TuanTrietPosition {
  final HousePosition first;
  final HousePosition second;
  const TuanTrietPosition({required this.first, required this.second});

  factory TuanTrietPosition.fromList(List<int> positions) {
    return TuanTrietPosition(
      first: HousePosition.fromIndex(positions[0]),
      second: HousePosition.fromIndex(positions[1]),
    );
  }

  @override
  String toString() {
    return 'first: ${first.toString()}, second: ${second.toString()}';
  }
}
