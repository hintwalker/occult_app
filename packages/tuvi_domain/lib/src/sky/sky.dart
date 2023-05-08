part of tuvi_domain;

class Sky {
  late Map<StarName, Star> stars;
  Sky(SkyConfig config) {
    stars = {};
    List<StarName> starNames = getStarNames(config.school);
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

  List<StarName> getStarNames(SchoolName school) {
    switch (school) {
      case SchoolName.tranDoan:
        return starIteratorTranDoan;
      default:
        return starIteratorTranDoan;
    }
  }

  Map<String, Map<String, Object?>> getStarInfos(SchoolName school) {
    switch (school) {
      case SchoolName.tranDoan:
        return starInfoTranDoan;
      case SchoolName.tuViVietNam:
        return defaultStarInfo;
      default:
        return defaultStarInfo;
    }
  }
}
