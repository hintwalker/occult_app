import 'package:sunoom/sunoom.dart';
import '../utils/split_to_list_of_list.dart';

import '../house/tuan_triet_position.dart';
import '../human/human_bio.dart';

TuanTrietPosition navigateTriet(HumanBio humanBio) {
  final trietData = '8;9,6;7,4;5,2;3,0;1,8;9,6;7,4;5,2;3,0;1';
  // final index = HoaGiap.findIndexForTuanNavigation(
  //   Can.ofLuniYear(humanBio.birthDay.luniSolarDate.year),
  //   Chi.ofLuniYear(humanBio.birthDay.luniSolarDate.year),
  // );
  final index = Can.ofLuniYear(humanBio.birthDay.luniSolarDate.year).index;
  // final List<List<String>> dataString =
  //     tuanData.split(',').map((e) => e.split(';')).toList();
  // final positions = dataString[index].map((e) => int.parse(e)).toList();
  final positions = trietData.splitToListOfList(';', ',');
  return TuanTrietPosition.fromList(positions[index]);
}
