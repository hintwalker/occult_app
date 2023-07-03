part of tuvi_domain;

Map<StarName, Star> navigateStars(
    {required HumanBio humanBio,
    required StarIterator starIterator,
    required Map<String, dynamic> formulas,
    required Map<StarName, Star> stars,
    Map<String, dynamic>? options}) {
  // List<Star> stars = [];
  final evaluator = ExpressionEvaluator();
  final posOfMenh = navigateMenh(humanBio);
  final posOfThan = navigateThan(humanBio);
  final canOfYear = Can.ofLuniYear(humanBio.birthDay.luniSolarDate.year);
  final chiOfYear = Chi.ofLuniYear(humanBio.birthDay.luniSolarDate.year);
  final canOfWatchingYear = Can.ofLuniYear(humanBio.watchingYear);
  final chiOfWatchingYear = Chi.ofLuniYear(humanBio.watchingYear);
  final chiOfTime = Chi.ofTime(humanBio.birthDay.time);
  final dnan = isDuongNamAmNu(chiOfYear, humanBio.gender);
  final k = dnan ? 1 : -1;
  final amDuongRel = findAmDuongRel(posOfMenh.toInt(), chiOfYear);
  final cuc = Cuc.from(
    canOfYearIndex: canOfYear.index,
    // chiOfYearIndex: chiOfYear.index,
    posOfMenh: posOfMenh.toInt(),
  );

  final Map<String, int> evalData = {
    StarFormulaKey.luniDay.name: humanBio.birthDay.luniSolarDate.day,
    // StarFormulaKey.luniDayIndex.name: humanBio.birthDay.luniSolarDate.day - 1,
    StarFormulaKey.hourIndex.name: chiOfTime.index,
    StarFormulaKey.posOfMenh.name: posOfMenh.toInt(),
    StarFormulaKey.posOfThan.name: posOfThan.toInt(),
    StarFormulaKey.cuc.name: cuc.value,
    StarFormulaKey.canOfWatchingYearIndex.name: canOfWatchingYear.index,
    StarFormulaKey.chiOfWatchingYearIndex.name: chiOfWatchingYear.index,
    StarFormulaKey.canOfYearIndex.name: canOfYear.index,
    StarFormulaKey.chiOfYearIndex.name: chiOfYear.index,
    StarFormulaKey.luniMonthIndex.name:
        humanBio.birthDay.luniSolarDate.month - 1,
    StarFormulaKey.k.name: k,
    StarFormulaKey.amDuongNghichLy.name:
        amDuongRel == AmDuongRel.amDuongNghichLy ? 1 : 0,
    ...options ?? {}
  };

  while (starIterator.moveNext()) {
    final currentStarName = starIterator.current;
    final formula = formulas[currentStarName.name];
    final oldStar = stars[currentStarName];
    if (formula != null || oldStar != null) {
      final expr = formula[StarFormulaKey.expression.name] as String;
      if (currentStarName.name == 'dauQuan') {
        print(expr);
      }
      // final dataValue = formula[StarFormulaKey.data.name];
      // List data = dataValue == null ? [] : dataValue as List;
      List data = [];
      final altDataValue = formula[StarFormulaKey.data.name];
      final altData = altDataValue == null ? null : altDataValue as String;
      if (altData != null && altData.isNotEmpty) {
        final altDataExpr = Expression.parse(altData);
        data = evaluator.eval(altDataExpr, evalData);
      }

      final expression = Expression.parse(expr);
      int result = evaluator.eval(expression, {
        'data': data,
        'floor': floor,
        'ceil': ceil,
        ...evalData,
      });
      final position = result.fitToHousePosition();

      final exportValue = formula[StarFormulaKey.export.name] as String?;
      final bool export = exportValue == null ? false : exportValue.toBoolean();

      if (export) {
        evalData[currentStarName.name] = position;
      }

      final strength = oldStar?.info.brightness[position];
      // final star = Star(
      //   name: currentStarName,
      //   position: HousePosition.fromIndex(position),
      // );
      final newStar = oldStar?.copyWith(
        position: HousePosition.fromIndex(position),
        strength: strength,
      );
      if (newStar != null) {
        stars[currentStarName] = newStar;
      }
    }
  }

  return stars;
}
