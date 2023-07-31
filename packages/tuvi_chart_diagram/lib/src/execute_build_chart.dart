import 'dart:async';

import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

Future<TuViChart> executeBuildChart(
  Chart data, {
  SkyConfig? config,
}) {
  final completer = Completer<TuViChart>();

  Future.delayed(const Duration(milliseconds: 0), () {
    final humanBio = data.toHumanBio();
    final tuviChart = buildTuViChart(
      humanBio: humanBio,
      sky: Sky.basic().copyWith(config: config),
      // starIterator: StarIterator(starIteratorTranDoan),
      // formulas: starFormulasTranDoan
    );
    completer.complete(tuviChart);
  });
  return completer.future;
}
