part of tuvi_domain;

TuViChart buildTuViChart({
  required HumanBio humanBio,
  required Sky sky,
  required StarIterator starIterator,
  required Map<String, Map<String, Object>> formulas,
}) {
  final stars = navigateStars(humanBio, starIterator, formulas, sky.stars);
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
  final yearlyTermOfWatchingYear = findYearlyTerm(
      HousePosition(Chi.ofLuniYear(humanBio.watchingYear)),
      chiOfBornYear,
      humanBio.gender);
  final monthlyTerm = findListMonthlyTerm(
      chiOfBornTime: chiOfBornTime,
      bornMonth: humanBio.birthDay.luniSolarDate.month,
      yearlyTermOfWatchingYear: yearlyTermOfWatchingYear);

  final Map<HousePosition, House> houses = poses.map((key, value) => MapEntry(
      key,
      House(
          name: value,
          can: canOfHouse(key, canOfBornYear),
          position: key,
          lifeMilestone: LifeMilestone(
              month: monthlyTerm[key]!,
              year: yearlyTerm[key]!,
              decade: decadeTerm[key]!))));

  houses[posOfThan]!.isThan = true;
  houses[posOfTriet.first]!.isTriet = true;
  houses[posOfTriet.second]!.isTriet = true;
  houses[posOfTuan.first]!.isTuan = true;
  houses[posOfTuan.second]!.isTuan = true;

  for (var star in stars.values) {
    if (star.info.isMajor) {
      houses[star.position]?.majorStars.add(star);
    } else if (star.info.isLife) {
      houses[star.position]?.lifeStar = star;
    } else {
      houses[star.position]?.minorStars.add(star);
    }
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
