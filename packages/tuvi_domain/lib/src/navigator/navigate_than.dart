import '../house/house_position.dart';
import '../human/human_bio.dart';
import 'navigate_house.dart';

final String thanExpression = "2 + luniMonthIndex + hourIndex";

HousePosition navigateThan(HumanBio humanBio) {
  return navigateHouse(humanBio: humanBio, formula: thanExpression);
}
