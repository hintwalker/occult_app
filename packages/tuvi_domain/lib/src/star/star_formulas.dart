part of tuvi_domain;

final starFormulas = {
  "tuVi": {
    "expression":
        "2+ (luniDay % cuc ==0 ? floor(luniDay/cuc) : ceil(luniDay/cuc)) - 1 + (luniDay % cuc ==0 ? 0 : (luniDay % cuc ==0 ? floor(luniDay/cuc) : ceil(luniDay/cuc)) * cuc - luniDay) *((q==0 ? 0 : (q==0 ? floor(luniDay/cuc) : ceil(luniDay/cuc)) * cuc - luniDay) % 2 == 0 ? 1 : -1)",
    "export": "true"
  },
  "liemTrinh": {"expression": "tuVi + 4"},
  "thienDong": {"expression": "tuVi + 7"},
  "vuKhuc": {"expression": "tuVi + 8"},
  "thaiDuong": {"expression": "tuVi + 9"},
  "thienCo": {"expression": "tuVi + 11"},
  "thienPhu": {"expression": "tuVi < 5 ? 4-tuVi : 16-tuVi", "export": "true"},
  "thaiAm": {"expression": "thienPhu + 1"},
  "thamLang": {"expression": "thienPhu + 2"},
  "cuMon": {"expression": "thienPhu + 3"},
  "thienTuong": {"expression": "thienPhu + 4"},
  "thienLuong": {"expression": "thienPhu + 5"},
  "thatSat": {"expression": "thienPhu + 6"},
  "phaQuan": {"expression": "thienPhu + 10"},
  "locTon": {
    "expression": "data[canOfYearIndex]",
    "data": "[2, 3, 5, 6, 5, 6, 8, 9, 11, 0]",
    "export": "true"
  },
  "kinhDuong": {"expression": "locTon + 1"},
  "daLa": {"expression": "locTon + 11"},
  "hoaTinh": {
    "expression": "data[chiOfYearIndex] + k * hourIndex",
    "data":
        "[2, hoaLinhOption ==0 ? 3 : 10, 1, 9, 2, hoaLinhOption ==0 ? 3 : 10, 1, 9, 2, hoaLinhOption ==0 ? 3 : 10, 1, 9]"
  },
  "linhTinh": {
    "expression": "data[chiOfYearIndex] - k * hourIndex",
    "data":
        "[10, hoaLinhOption ==0 ? 10 : 3, 3, 10, 10, hoaLinhOption ==0 ? 10 : 3, 3, 10, 10, hoaLinhOption ==0 ? 10 : 3, 3, 10]"
  },
  "vanXuong": {"expression": "10 - hourIndex"},
  "vanKhuc": {"expression": "hourIndex + 4"},
  "thienKhoi": {
    "expression": "data[canOfYearIndex]",
    "data": "[1, 0, 11, 11, 1, 0, 6, 6, 3, 3]"
  },
  "thienViet": {
    "expression": "data[canOfYearIndex]",
    "data": "[7, 8, 9, 9, 7, 8, 2, 2, 5, 5]"
  },
  "taPhu": {"expression": "luniMonthIndex + 4"},
  "huuBat": {"expression": "10 - luniMonthIndex"},
  "diaKiep": {"expression": "11 + hourIndex"},
  "diaKhong": {"expression": "11 - hourIndex"},
  "thienKhong": {"expression": "chiOfYearIndex + 1"},
  "hoaLoc": {
    "expression": "data[canOfYearIndex]",
    "data":
        "[4+tuVi,11+tuVi,7+tuVi,1+thienPhu,2+thienPhu,8+tuVi,9+tuVi,3+thienPhu,5+thienPhu,10+thienPhu]"
  },
  "hoaQuyen": {
    "expression": "data[canOfYearIndex]",
    "data":
        "[10+thienPhu,5+thienPhu,11+tuVi,7+tuVi,1+thienPhu,2+thienPhu,8+tuVi,nhatHoaQuyen ==0 ? 9+tuVi : 5+thienPhu,tuVi,3+thienPhu]"
  },
  "hoaKhoa": {
    "expression": "data[canOfYearIndex]",
    "data":
        "[8+tuVi,tuVi,10-hourIndex,11+tuVi,10-luniMonthIndex,5+thienPhu,dongHoaKhoa ==0 ? 1+thienPhu : 7+tuVi,4+hourIndex,phuHoaKhoa ==0 ? thienPhu : 4+luniMonthIndex,1+thienPhu]"
  },
  "hoaKy": {
    "expression": "data[canOfYearIndex]",
    "data":
        "[9+tuVi,1+thienPhu,4+tuVi,3+thienPhu,11+tuVi,4+hourIndex,dongHoaKy ==0 ? 1+thienPhu : 7+tuVi,10-hourIndex,8+tuVi,2+thienPhu]"
  },
  "daiHao": {"expression": "locTon + k * 9"},
  "tieuHao": {"expression": "locTon + k * 3"},
  "tangMon": {"expression": "chiOfYearIndex + 2"},
  "bachHo": {"expression": "chiOfYearIndex + 8"},
  "thienKhoc": {"expression": "6 - chiOfYearIndex"},
  "thienHu": {"expression": "chiOfYearIndex + 6"},
  "thienMa": {
    "expression": "data[chiOfYearIndex]",
    "data": "[2, 11, 8, 5, 2, 11, 8, 5, 2, 11, 8, 5]"
  },
  "thienHinh": {"expression": "luniMonthIndex + 9"},
  "thienRieu": {"expression": "luniMonthIndex + 1"},
  "longTri": {"expression": "chiOfYearIndex + 4"},
  "phuongCac": {"expression": "10 - chiOfYearIndex"},
  "tamThai": {"expression": "luniMonthIndex + luniDay + 3"},
  "batToa": {"expression": "10-luniMonthIndex-luniDay-1"},
  "anQuang": {"expression": "10-hourIndex + luniDay-2"},
  "thienQuy": {"expression": "hourIndex-luniDay+ 4"},
  "daoHoa": {
    "expression": "data[chiOfYearIndex]",
    "data": "[9, 6, 3, 0, 9, 6, 3, 0, 9, 6, 3, 0]"
  },
  "hongLoan": {"expression": "3 - chiOfYearIndex"},
  "thienHi": {"expression": "10 - luniMonthIndex"},
  "thaiPhu": {"expression": "hourIndex + 4 + 2"},
  "phongCao": {"expression": "hourIndex + 4 - 2"},
  "quocAn": {"expression": "locTon + 8"},
  "duongPhu": {"expression": "locTon + 5"},
  "thienTho": {"expression": "2 + luniMonthIndex + hourIndex + chiOfYearIndex"},
  "bacSi": {
    "expression": "data[canOfYearIndex]",
    "data": "[2, 3, 5, 6, 5, 6, 8, 9, 11, 0]"
  },
  "luuNienVanTinh": {
    "expression": "data[canOfYearIndex]",
    "data": "[5, 6, 8, 9, 8, 9, 11, 0, 9, 3]"
  },
  "hoaCai": {
    "expression": "data[chiOfYearIndex]",
    "data": "[4, 1, 10, 7, 4, 1, 10, 7, 4, 1, 10, 7]"
  },
  "thienTru": {
    "expression": "data[canOfYearIndex]",
    "data": "[5, 6, 0, 5, 6, 8, 2, 6, 9, 10]"
  },
  "thienQuan": {
    "expression": "data[canOfYearIndex]",
    "data": "[7, 4, 5, 2, 3, 9, 11, 9, 10, 6]"
  },
  "thienPhuc": {
    "expression": "data[canOfYearIndex]",
    "data": "[9, 8, 0, 11, 3, 2, 6, 5, 6, 5]"
  },
  "thienGiai": {"expression": "luniMonthIndex + 8"},
  "diaGiai": {"expression": "luniMonthIndex + 7"},
  "giaiThan": {"expression": "10 - chiOfYearIndex"},
  "thienDuc": {"expression": "chiOfYearIndex + 9"},
  "nguyetDuc": {"expression": "chiOfYearIndex + 5"},
  "thienY": {
    "expression": "data[chiOfYearIndex]",
    "data": "[5, 1, 9, 5, 1, 9, 5, 1, 9, 5, 1, 9]"
  },
  "coThan": {
    "expression": "data[chiOfYearIndex]",
    "data": "[2, 2, 5, 5, 5, 8, 8, 8, 11, 11, 11, 2]"
  },
  "quaTu": {
    "expression": "data[chiOfYearIndex]",
    "data": "[10, 10, 1, 1, 1, 4, 4, 4, 7, 7, 7, 10]"
  },
  "dauQuan": {
    "expression":
        "(dauQuanOption ==0 ? chiOfYearIndex: 0) - luniMonthIndex + hourIndex"
  },
  "thienThuong": {"expression": "2 + luniMonthIndex - hourIndex + 5"},
  "thienSu": {"expression": "2 + luniMonthIndex - hourIndex + 7"},
  "kiepSat": {
    "expression": "data[chiOfYearIndex]",
    "data": "[5, 2, 11, 8, 5, 2, 11, 8, 5, 2, 11, 8]"
  },
  "luuHa": {
    "expression": "data[canOfYearIndex]",
    "data":
        "[9, 10, 7, luHaOption ==0 ? 4 : 8, 5, 6, luHaOption ==0 ? 8 : 4, 3, 11, 2]"
  },
  "phaToai": {
    "expression": "data[chiOfYearIndex]",
    "data": "[5, 1, 9, 5, 1, 9, 5, 1, 9, 5, 1, 9]"
  },
  "thienTai": {"expression": "2 + luniMonthIndex - hourIndex + chiOfYearIndex"},
  "thienLa": {"expression": "4"},
  "diaVong": {"expression": "10"},
  "thaiTue": {"expression": "chiOfYearIndex"},
  "thieuDuong": {"expression": "chiOfYearIndex + 1"},
  "thieuAm": {"expression": "canOfYearIndex + 3"},
  "quanPhur": {"expression": "locTon + k * 11"},
  "tuPhu": {"expression": "locTon + 8"},
  "trucPhu": {"expression": "chiOfYearIndex + 11"},
  "tuePha": {"expression": "chiOfYearIndex + 6"},
  "longDuc": {"expression": "chiOfYearIndex + 7"},
  "phucDuc": {"expression": "chiOfYearIndex + 9"},
  "dieuKhach": {"expression": "chiOfYearIndex + 10"},
  "lucSi": {"expression": "locTon + k"},
  "thanhLong": {"expression": "locTon + k * 2"},
  "tuongQuan": {"expression": "locTon + k * 4"},
  "tauThu": {"expression": "locTon + k * 5"},
  "phiLiem": {"expression": "locTon + k * 6"},
  "hyThan": {"expression": "locTon + k * 7"},
  "benhPhu": {"expression": "locTon + k * 8"},
  "phucBinh": {"expression": "locTon + k * 10"},
  "quanPhuf": {"expression": "chiOfYearIndex + 4"},
  "truongSinh": {
    "expression": "data[cuc-2]",
    "data":
        "[truongSinhOption ==0 ? 8 : amDuongNghichLy==0 ? 8 : 0, truongSinhOption ==0 ? 11 : amDuongNghichLy==0 ? 11 : 3, truongSinhOption ==0 ? 5 : amDuongNghichLy==0 ? 5 : 9, truongSinhOption ==0 ? 8 : amDuongNghichLy==0 ? 8 : 0, truongSinhOption ==0 ? 2 : amDuongNghichLy==0 ? 2 : 6]",
    "export": "true"
  },
  "mocDuc": {"expression": "truongSinh + k * 1"},
  "quanDoi": {"expression": "truongSinh + k * 2"},
  "lamQuan": {"expression": "truongSinh + k * 3"},
  "deVuong": {"expression": "truongSinh + k * 4"},
  "suy": {"expression": "truongSinh + k * 5"},
  "benh": {"expression": "truongSinh + k * 6"},
  "tu": {"expression": "truongSinh + k * 7"},
  "mo": {"expression": "truongSinh + k * 8"},
  "tuyet": {"expression": "truongSinh + k * 9"},
  "thai": {"expression": "truongSinh + k * 10"},
  "duong": {"expression": "truongSinh + k * 11"},
  "luuLocTon": {
    "expression": "data[canOfWatchingYearIndex]",
    "data": "[2, 3, 5, 6, 5, 6, 8, 9, 11, 0]",
    "export": "true"
  },
  "luuBachHo": {"expression": "chiOfWatchingYearIndex + 8"},
  "luuDaLa": {
    "expression": "data[canOfWatchingYearIndex] + 11",
    "data": "[2, 3, 5, 6, 5, 6, 8, 9, 11, 0]"
  },
  "luuKinhDuong": {
    "expression": "data[canOfWatchingYearIndex] + 1",
    "data": "[2, 3, 5, 6, 5, 6, 8, 9, 11, 0]"
  },
  "luuTangMon": {"expression": "chiOfWatchingYearIndex + 2"},
  "luuThaiTue": {"expression": "chiOfWatchingYearIndex"},
  "luuThienHu": {"expression": "chiOfWatchingYearIndex + 6"},
  "luuThienKhoc": {"expression": "6 - chiOfWatchingYearIndex"},
  "luuThienMa": {
    "expression": "data[chiOfWatchingYearIndex]",
    "data": "[2, 11, 8, 5, 2, 11, 8, 5, 2, 11, 8, 5]"
  },
  "amSat": {
    "expression": "data[luniMonthIndex]",
    "data": "[2, 0, 10, 8, 6, 4, 2, 0, 10, 8, 6, 4]"
  },
  "tuongTinh": {
    "expression": "data[chiOfYearIndex]",
    "data": "[5, 9, 6, 3, 5, 9, 6, 3, 5, 9, 6, 3]"
  },
  "phanAn": {
    "expression": "data[chiOfYearIndex]",
    "data": "[6, 10, 7, 4, 6, 10, 7, 4, 6, 10, 7, 4]"
  },
  "tueDich": {
    "expression": "data[chiOfYearIndex]",
    "data": "[7, 11, 8, 5, 7, 11, 8, 5, 7, 11, 8, 5]"
  },
  "tucThan": {
    "expression": "data[chiOfYearIndex]",
    "data": "[8, 0, 9, 6, 8, 0, 9, 6, 8, 0, 9, 6]"
  },
  "taiSat": {
    "expression": "data[chiOfYearIndex]",
    "data": "[11, 3, 0, 9, 11, 3, 0, 9, 11, 3, 0, 9]"
  },
  "thienSat": {
    "expression": "data[chiOfYearIndex]",
    "data": "[0, 4, 1, 10, 0, 4, 1, 10, 0, 4, 1, 10]"
  },
  "chiBoi": {
    "expression": "data[chiOfYearIndex]",
    "data": "[1, 5, 2, 11, 1, 5, 2, 11, 1, 5, 2, 11]"
  },
  "nguyetSat": {
    "expression": "data[chiOfYearIndex]",
    "data": "[3, 7, 4, 1, 3, 7, 4, 1, 3, 7, 4, 1]"
  },
  "vongThan": {
    "expression": "data[chiOfYearIndex]",
    "data": "[4, 8, 5, 2, 4, 8, 5, 2, 4, 8, 5, 2]"
  }
};
