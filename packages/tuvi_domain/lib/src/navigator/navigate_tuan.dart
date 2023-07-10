import 'package:sunoom/sunoom.dart';
import '../utils/split_to_list_of_list.dart';

import '../house/tuan_triet_position.dart';
import '../human/human_bio.dart';

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
