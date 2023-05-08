part of tuvi_domain;

final String menhExpression = "2 + luniMonthIndex - hourIndex";

HousePosition navigateMenh(HumanBio humanBio) {
  return navigateHouse(humanBio: humanBio, formula: menhExpression);
}
