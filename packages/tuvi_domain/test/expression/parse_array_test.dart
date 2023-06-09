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
    final result = evaluator.eval(expression, {});
    print(result);
    expect(result[0] as int, 2);
  });

  test('should get String in array', () {
    final expressionString =
        "['dongHoaKhoa ? 2 : 2+3', 3, 5, 6, 5, 6, 8, 9, 11, 0]";
    final expression = Expression.parse(expressionString);
    final evaluator = ExpressionEvaluator();
    final result = evaluator.eval(expression, {});
    print(result);
    // expect(result[0] as String, '2+3');
    final expression2 = Expression.parse(result[0] as String);
    final result2 = evaluator.eval(expression2, {'dongHoaKhoa': true});
    expect(result2, 2);
    final result3 = evaluator.eval(expression2, {'dongHoaKhoa': false});
    expect(result3, 5);
  });

  test('should parse array with if inside', () {
    final expressionString =
        "[dongHoaKhoa ? 2 : 2+3, 3, 5, 6, 5, 6, 8, 9, 11, 0]";
    final expression = Expression.parse(expressionString);
    final evaluator = ExpressionEvaluator();
    final result = evaluator.eval(expression, {'dongHoaKhoa': false});
    print(result);
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
