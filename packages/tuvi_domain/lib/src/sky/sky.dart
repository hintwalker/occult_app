import '../house/house_position.dart';
import '../school/school_name.dart';
import '../sky/sky_config.dart';

import '../star/info/basic_star_info.dart';
import '../star/star.dart';
import '../star/star_formulas.dart';
import '../star/star_info.dart';
import '../star/star_iterator.dart';
import '../star/star_name.dart';

class Sky {
  late Map<StarName, Star> stars;
  final SkyConfig config;
  final Map<String, Map<String, String>> formulas;

  StarIterator get starIterator => StarIterator(StarName.values);
  Sky({required this.config, required this.formulas}) {
    stars = {};
    List<StarName> starNames = StarName.values; // getStarNames(config.school);
    final starInfos = getStarInfos(config.school);
    for (var starName in starNames) {
      final info = starInfos[starName.name];
      stars[starName] = Star(
        name: starName,
        position: HousePosition.unknown(),
        info: info == null ? StarInfo.noInfo() : StarInfo.fromMap(info),
      );
    }
  }

  factory Sky.basic() => Sky(config: SkyConfig.basic(), formulas: starFormulas);

  // List<StarName> getStarNames(SchoolName school) {
  //   switch (school) {
  //     case SchoolName.basic:
  //       return starIteratorTranDoan;
  //     default:
  //       return starIteratorTranDoan;
  //   }
  // }

  Map<String, Map<String, Object?>> getStarInfos(SchoolName school) {
    switch (school) {
      case SchoolName.basic:
        return basicStarInfo;
      // case SchoolName.tuViVietNam:
      //   return defaultStarInfo;
      default:
        return basicStarInfo;
    }
  }
}
