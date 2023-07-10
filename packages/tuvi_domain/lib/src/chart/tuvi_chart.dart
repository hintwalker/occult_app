import 'package:sunoom/sunoom.dart';

import '../cuc/cuc.dart';
import '../house/house.dart';
import '../house/house_position.dart';
import '../house/tuan_triet_position.dart';
import '../human/human_bio.dart';

class TuViChart {
  final Map<HousePosition, House> houses;
  final TuanTrietPosition posOfTuan;
  final TuanTrietPosition posOfTriet;
  final HousePosition posOfMenh;
  final HousePosition posOfThan;
  final Cuc cuc;
  final HoaGiap banMenh;
  final HumanBio humanBio;
  const TuViChart({
    required this.houses,
    required this.posOfMenh,
    required this.posOfThan,
    required this.posOfTuan,
    required this.posOfTriet,
    required this.cuc,
    required this.banMenh,
    required this.humanBio,
  });
}
