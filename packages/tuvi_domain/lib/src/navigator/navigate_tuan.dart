part of tuvi_domain;

TuanTrietPosition navigateTuan(HumanBio humanBio) {
  final tuanData = '10;11,8;9,6;7,4;5,2;3,0;1';
  final index = HoaGiap.findIndexForTuanNavigation(
    Can.ofLuniYear(humanBio.birthDay.luniSolarDate.year),
    Chi.ofLuniYear(humanBio.birthDay.luniSolarDate.year),
  );
  // final List<List<String>> dataString =
  //     tuanData.split(',').map((e) => e.split(';')).toList();
  // final positions = dataString[index].map((e) => int.parse(e)).toList();
  final positions = tuanData.splitToListOfList(';', ',');
  return TuanTrietPosition.fromList(positions[index]);
}
