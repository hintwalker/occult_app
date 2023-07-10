enum HouseName {
  menh(0, 'menh'),
  phuMau(1, 'phuMau'),
  phucDuc(2, 'phucDuc'),
  dienTrach(3, 'dienTrach'),
  quanLoc(4, 'quanLoc'),
  noBoc(5, 'noBoc'),
  thienDi(6, 'thienDi'),
  tatAch(7, 'tatAch'),
  taiBach(8, 'taiBach'),
  tuTuc(9, 'tuTuc'),
  phuThe(10, 'phoi'),
  huynhDe(11, 'huynhDe'),
  than(-1, 'than'),
  unknown(-1, 'unknown');

  const HouseName(this.deltaFromMenh, this.bacPhaiName);
  final int deltaFromMenh;
  final String bacPhaiName;
}
