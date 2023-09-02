import 'package:sunoom/sunoom.dart';

import '../cuc/cuc.dart';
import '../house/can_of_house.dart';
import '../house/house.dart';
import '../house/house_position.dart';
import '../house/life_milestone.dart';
import '../human/duong_nam_am_nu.dart';
import '../human/human_bio.dart';
import '../navigator/navigate_menh.dart';
import '../navigator/navigate_other_house.dart';
import '../navigator/navigate_stars.dart';
import '../navigator/navigate_than.dart';
import '../navigator/navigate_triet.dart';
import '../navigator/navigate_tuan.dart';
import '../sky/sky.dart';
import '../star/star.dart';
import '../term/find_decade_term.dart';
import '../term/find_monthly_term.dart';
import '../term/find_yearly_term.dart';
import 'tuvi_chart.dart';

TuViChart buildTuViChart({
  required HumanBio humanBio,
  required Sky sky,
  // required StarIterator starIterator,
  // required Map<String, Map<String, Object>> formulas,
}) {
  final stars = navigateStars(
      humanBio: humanBio,
      starIterator: sky.starIterator,
      formulas: sky.formulas,
      stars: sky.stars,
      options: sky.config.options);
  final posOfMenh = navigateMenh(humanBio);
  final posOfThan = navigateThan(humanBio);
  final poses = navigateListHouse(posOfMenh);
  final posOfTuan = navigateTuan(humanBio);
  final posOfTriet = navigateTriet(humanBio);
  final canOfBornYear = Can.ofLuniYear(humanBio.birthDay.luniSolarDate.year);
  final chiOfBornYear = Chi.ofLuniYear(humanBio.birthDay.luniSolarDate.year);
  final chiOfBornTime = Chi.ofTime(humanBio.birthDay.time);
  final dnan = isDuongNamAmNu(chiOfBornYear, humanBio.gender);
  final banMenh = HoaGiap.fromCanChi(canOfBornYear, chiOfBornYear);
  final cuc = Cuc.from(
      canOfYearIndex: canOfBornYear.index, posOfMenh: posOfMenh.toInt());

  final decadeTerm =
      findListDecadeTerm(menhPosition: posOfMenh, dnan: dnan, cuc: cuc);
  final yearlyTerm = findListYearlyTerm(chiOfBornYear, humanBio.gender);
  // Tìm cung có lưu niên tiểu hạn trùng với năm xem (xét theo chi)
  final watchingYearHouse = yearlyTerm.entries
      .where(
          (element) => element.value == Chi.ofLuniYear(humanBio.watchingYear))
      .first;

  // final yearlyTermOfWatchingYear = findYearlyTerm(
  //     HousePosition(Chi.ofLuniYear(humanBio.watchingYear)),
  //     chiOfBornYear,
  //     humanBio.gender);
  final monthlyTerm = findListMonthlyTerm(
      chiOfBornTime: chiOfBornTime,
      bornMonth: humanBio.birthDay.luniSolarDate.month,
      yearlyTermOfWatchingYear: watchingYearHouse.key.chi);

  House house = House.initial();
  final Map<HousePosition, House> houses = poses.map(
    (key, value) => MapEntry(
      key,
      house.copyWith(
        name: value,
        can: canOfHouse(key, canOfBornYear),
        position: key,
        lifeMilestone: LifeMilestone(
          month: monthlyTerm[key]!,
          year: yearlyTerm[key]!,
          decade: decadeTerm[key]!,
        ),
      ),
      // House(
      //   name: value,
      //   can: canOfHouse(key, canOfBornYear),
      //   position: key,
      //   lifeMilestone: LifeMilestone(
      //       month: monthlyTerm[key]!,
      //       year: yearlyTerm[key]!,
      //       decade: decadeTerm[key]!),
      // ),
    ),
  );

  houses[posOfThan] = houses[posOfThan]!.copyWith(isThan: true);
  houses[posOfTriet.first] = houses[posOfTriet.first]!.copyWith(isTriet: true);
  houses[posOfTriet.second] =
      houses[posOfTriet.second]!.copyWith(isTriet: true);
  houses[posOfTuan.first] = houses[posOfTuan.first]!.copyWith(isTuan: true);
  houses[posOfTuan.second] = houses[posOfTuan.second]!.copyWith(isTuan: true);

  Map<HousePosition, List<Star>> majorStars = {};
  Map<HousePosition, List<Star>> minorStars = {};
  Map<HousePosition, Star> lifeStars = {};
  for (var star in stars.values) {
    if (star.position != HousePosition.unknown()) {
      if (star.info.isMajor) {
        if (majorStars[star.position] == null) {
          majorStars[star.position] = [];
        }
        majorStars[star.position]!.add(star);
        // houses[star.position]?.majorStars.add(star);
      } else if (star.info.isLife) {
        lifeStars[star.position] = star;
        // houses[star.position] = houses[star.position]!.copyWith(lifeStar: star);
      } else {
        if (minorStars[star.position] == null) {
          minorStars[star.position] = [];
        }
        minorStars[star.position]!.add(star);
        // houses[star.position]?.minorStars.add(star);
      }
    }
  }
  for (var position in lifeStars.keys) {
    houses[position] = houses[position]!.copyWith(
      majorStars: majorStars[position],
      minorStars: minorStars[position],
      lifeStar: lifeStars[position],
    );
  }

  return TuViChart(
    houses: houses,
    posOfMenh: posOfMenh,
    posOfThan: posOfThan,
    posOfTuan: posOfTuan,
    posOfTriet: posOfTriet,
    cuc: cuc,
    banMenh: banMenh,
    humanBio: humanBio,
  );
}
