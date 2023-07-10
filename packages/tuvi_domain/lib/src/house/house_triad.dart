import 'house_position.dart';

class HouseTriad {
  final HousePosition source;
  final HousePosition nextClockWise;
  final HousePosition other;
  const HouseTriad({
    required this.source,
    required this.nextClockWise,
    required this.other,
  });
}
