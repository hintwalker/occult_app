import '../house/house_position.dart';
import '../human/human_bio.dart';
import 'navigate_house.dart';

final String menhExpression = "2 + luniMonthIndex - hourIndex";

HousePosition navigateMenh(HumanBio humanBio) {
  return navigateHouse(humanBio: humanBio, formula: menhExpression);
}
