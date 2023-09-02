import 'package:sunoom/sunoom.dart';
import 'fit_to_house_position.dart';

import '../star/star.dart';
import 'house_name.dart';
import 'house_pair.dart';
import 'house_position.dart';
import 'house_triad.dart';
import 'life_milestone.dart';

class House {
  final HouseName name;
  final List<Star> majorStars;
  final List<Star> minorStars;
  final Star lifeStar;
  final HousePosition position;

  final LifeMilestone lifeMilestone;
  final bool isThan;
  final Can can;
  final bool isTuan;
  final bool isTriet;
  // late HousePair _pair;

  // final HouseTriad _triad;

  // final HousePair opposition;
  // HousePair get opposition => _opposition;

// HousePair get pair => _pair;
// HouseTriad get triad => _triad;
//   HousePosition get position => _position;

  const House({
    required this.name,
    required this.majorStars,
    required this.minorStars,
    required this.lifeStar,
    required this.position,
    required this.lifeMilestone,
    this.isThan = false,
    this.isTuan = false,
    this.isTriet = false,
    required this.can,
  });
  //     : majorStars = majorStars ?? [],
  //       minorStars = minorStars ?? [],
  //       // _position = position ?? HousePosition.unknown(),
  //       lifeMilestone = lifeMilestone ?? LifeMilestone.unknown() {
  //   updatePosition(position);
  // }

  // const House initial({

  // });

  // void updatePosition(HousePosition? value) {
  //   _position = value ?? HousePosition.unknown();
  //   _pair = findPair();
  //   _triad = findTriad();
  // }

  const House.initial({
    this.name = HouseName.unknown,
    this.position = const HousePosition.initial(),
    this.can = const Can.initial(),
    this.majorStars = const [],
    this.minorStars = const [],
    this.lifeStar = const Star.initial(),
    this.lifeMilestone = const LifeMilestone.initial(),
    this.isThan = false,
    this.isTriet = false,
    this.isTuan = false,
  });

  House copyWith({
    HouseName? name,
    List<Star>? majorStars,
    List<Star>? minorStars,
    Star? lifeStar,
    HousePosition? position,
    LifeMilestone? lifeMilestone,
    bool? isThan,
    Can? can,
    bool? isTuan,
    bool? isTriet,
  }) =>
      House(
        name: name ?? this.name,
        majorStars: majorStars ?? this.majorStars,
        minorStars: minorStars ?? this.minorStars,
        lifeStar: lifeStar ?? this.lifeStar,
        position: position ?? this.position,
        lifeMilestone: lifeMilestone ?? this.lifeMilestone,
        can: can ?? this.can,
        isThan: isThan ?? this.isThan,
        isTriet: isTriet ?? this.isTriet,
        isTuan: isTuan ?? this.isTuan,
      );

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
