part of tuvi_domain;

enum DuongNamAmNu { duongNam, amNu, duongNu, amNam }

bool isDuongNamAmNu(Chi chiOfYear, Gender gender) {
  bool isMale = gender == Gender.male;
  return (chiOfYear.index % 2 == 0 && isMale) ||
      (chiOfYear.index % 2 == 1 && !isMale);
}
