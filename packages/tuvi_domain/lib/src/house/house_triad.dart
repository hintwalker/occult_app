part of tuvi_domain;

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
