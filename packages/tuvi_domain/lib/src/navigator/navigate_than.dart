part of tuvi_domain;

final String thanExpression = "2 + luniMonthIndex + hourIndex";

HousePosition navigateThan(HumanBio humanBio) {
  return navigateHouse(humanBio: humanBio, formula: thanExpression);
}
