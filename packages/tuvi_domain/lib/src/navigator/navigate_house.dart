import 'package:expressions/expressions.dart';
import '../house/fit_to_house_position.dart';

import '../house/house_position.dart';
import '../human/human_bio.dart';

HousePosition navigateHouse({
  required HumanBio humanBio,
  required String formula,
}) {
  final expression = Expression.parse(formula);
  final evaluator = ExpressionEvaluator();
  int index = evaluator.eval(expression, humanBio.toMap());
  return HousePosition.fromIndex(index.fitToHousePosition());
}
