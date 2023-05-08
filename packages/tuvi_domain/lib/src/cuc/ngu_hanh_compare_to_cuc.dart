part of tuvi_domain;

extension NguHanhCompareToCuc on NguHanh {
  MenhCucRel compareToCuc(Cuc cuc) {
    final nguHanhFromCuc = cuc.nguHanh;
    final nguHanhRel = compareTo(nguHanhFromCuc);
    return _relFromNguHanhRel(nguHanhRel);
  }

  MenhCucRel _relFromNguHanhRel(NguHanhRel rel) {
    final data = {
      NguHanhRelNames.sinh: MenhCucRel.menhSinhCuc,
      NguHanhRelNames.khac: MenhCucRel.menhKhacCuc,
      NguHanhRelNames.duocSinhBoi: MenhCucRel.cucSinhMenh,
      NguHanhRelNames.biKhacBoi: MenhCucRel.cucKhacMenh,
      NguHanhRelNames.tiHoa: MenhCucRel.menhCucTiHoa,
    };
    return data[rel.name]!;
  }
}
