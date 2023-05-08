part of tuvi_domain;

HousePosition navigateHouse({
  required HumanBio humanBio,
  required String formula,
}) {
  final expression = Expression.parse(formula);
  final evaluator = ExpressionEvaluator();
  int index = evaluator.eval(expression, humanBio.toMap());
  return HousePosition.fromIndex(index.fitToHousePosition());
}
