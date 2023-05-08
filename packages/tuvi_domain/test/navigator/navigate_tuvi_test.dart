import 'package:test/test.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

void main() {
  test('should navigate tuvi', () {
    final luniDay = 13;
    final cuc = 6;
    final q = luniDay % cuc;
    final a = luniDay % cuc == 0 ? floor(luniDay / cuc) : ceil(luniDay / cuc);
    final b = luniDay % cuc == 0
        ? 0
        : (luniDay % cuc == 0 ? floor(luniDay / cuc) : ceil(luniDay / cuc)) *
                cuc -
            luniDay;

    final result = 2 +
        (luniDay % cuc == 0 ? floor(luniDay / cuc) : ceil(luniDay / cuc)) -
        1 +
        (luniDay % cuc == 0
                ? 0
                : (luniDay % cuc == 0
                            ? floor(luniDay / cuc)
                            : ceil(luniDay / cuc)) *
                        cuc -
                    luniDay) *
            ((luniDay % cuc == 0
                            ? 0
                            : (luniDay % cuc == 0
                                        ? floor(luniDay / cuc)
                                        : ceil(luniDay / cuc)) *
                                    cuc -
                                luniDay) %
                        2 ==
                    0
                ? 1
                : -1);
    print(result);
    expect(result, 2);
  });

  test('should navigate tuvi', () {
    final day = 13;
    final cuc = 6;
    final q = day % cuc;

    final result = 2 +
        (q == 0 ? floor(day / cuc) : floor(day / cuc) + 1) -
        1 +
        (q == 0
                ? 0
                : (q == 0 ? floor(day / cuc) : floor(day / cuc) + 1) * cuc -
                    day) *
            ((q == 0
                            ? 0
                            : (q == 0
                                        ? floor(day / cuc)
                                        : floor(day / cuc) + 1) *
                                    cuc -
                                day) %
                        2 ==
                    0
                ? 1
                : -1);
    print(result);
    expect(result, 2);
  });

  test('should navigate tuvi 2', () {
    final day = 13;
    final cuc = 4;
    final r = day % cuc;
    final floorDayCuc = floor(day / cuc);
    final ceilDayCuc = ceil(day / cuc);

    final b = day % cuc == 0 ? floor(day / cuc) : ceil(day / cuc);
    final a = day % cuc == 0 ? 0 : b * cuc - day;
    final k = a % 2 == 0 ? 1 : -1;
    final tuvi = 2 + b - 1 + a * k;
    print('r:$r, floor:$floorDayCuc, ceil: $ceilDayCuc');
    print('a: $a, b: $b, k: $k');
    print('tuvi: $tuvi');
    // expect(tuvi, 2);
  });
}
