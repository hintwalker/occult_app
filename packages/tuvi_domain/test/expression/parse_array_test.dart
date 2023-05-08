import 'package:expressions/expressions.dart';
import 'package:test/test.dart';

void main() {
  test('should parse array with variable', () {
    final expressionString = '[a,b]';
    final expression = Expression.parse(expressionString);
    final evaluator = ExpressionEvaluator();
    final result = evaluator.eval(expression, {'a': 1, 'b': 2}) as List;
    print(result);
    expect(result.length, 2);
  });

  test('should get element from array', () {
    final expressionString = '[2, 3, 5, 6, 5, 6, 8, 9, 11, 0]';
    final expression = Expression.parse(expressionString);
    final evaluator = ExpressionEvaluator();
    final result = evaluator.eval(expression, {}) as int;
    print(result);
    expect(result, 2);
  });

  test('should use if', () {
    final expressionString = 'k==1 ? data[cuc-2] : data[cuc + 3]';
    final expression = Expression.parse(expressionString);
    final evaluator = ExpressionEvaluator();
    final result = evaluator.eval(expression, {
      'k': -1,
      'data': [8, 11, 5, 8, 2, 0, 3, 9, 0, 5],
      'cuc': 6
    }) as int;
    print(result);
    expect(result, 5);
  });
}
