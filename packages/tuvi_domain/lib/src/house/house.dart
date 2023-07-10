import 'package:sunoom/sunoom.dart';
import 'fit_to_house_position.dart';

import '../star/star.dart';
import 'house_name.dart';
import 'house_pair.dart';
import 'house_position.dart';
import 'house_triad.dart';
import 'life_milestone.dart';

class House {
  HouseName name;
  List<Star> majorStars;
  List<Star> minorStars;
  Star? lifeStar;
  late HousePosition _position;
  HousePosition get position => _position;
  LifeMilestone lifeMilestone;
  bool isThan;
  Can? can;
  bool isTuan;
  bool isTriet;
  late HousePair _pair;
  HousePair get pair => _pair;
  late HouseTriad _triad;
  HouseTriad get triad => _triad;
  late HousePair _opposition;
  HousePair get opposition => _opposition;

  House(
      {required this.name,
      List<Star>? majorStars,
      List<Star>? minorStars,
      this.lifeStar,
      HousePosition? position,
      LifeMilestone? lifeMilestone,
      this.isThan = false,
      this.isTuan = false,
      this.isTriet = false,
      this.can})
      : majorStars = majorStars ?? [],
        minorStars = minorStars ?? [],
        // _position = position ?? HousePosition.unknown(),
        lifeMilestone = lifeMilestone ?? LifeMilestone.unknown() {
    updatePosition(position);
  }

  void updatePosition(HousePosition? value) {
    _position = value ?? HousePosition.unknown();
    _pair = findPair();
    _triad = findTriad();
  }

  HousePair findPair() {
    if (position == HousePosition.unknown()) {
      return HousePair(source: position, other: position);
    }
    final data = [1, 0, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2];
    final otherInt = data[position.toInt()];
    final other = HousePosition.fromIndex(otherInt);
    return HousePair(source: position, other: other);
  }

  HouseTriad findTriad() {
    if (position == HousePosition.unknown()) {
      return HouseTriad(
          source: position, nextClockWise: position, other: position);
    }
    final clockWiseIndex = (position.toInt() + 4).fitToHousePosition();
    final otherIndex = (position.toInt() + 8).fitToHousePosition();
    return HouseTriad(
      source: position,
      nextClockWise: HousePosition.fromIndex(clockWiseIndex),
      other: HousePosition.fromIndex(otherIndex),
    );
  }

  HousePair findOpposition() {
    if (position == HousePosition.unknown()) {
      return HousePair(source: position, other: position);
    }
    final otherIndex = (position.toInt() + 6).fitToHousePosition();
    return HousePair(
        source: position, other: HousePosition.fromIndex(otherIndex));
  }
}
