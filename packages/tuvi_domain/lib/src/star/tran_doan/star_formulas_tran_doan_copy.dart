// final starFormulasTranDoanCopy = {
//   "tuVi": {
//     "expression":
//         "2+ (luniDay % cuc ==0 ? floor(luniDay/cuc) : ceil(luniDay/cuc)) - 1 + (luniDay % cuc ==0 ? 0 : (luniDay % cuc ==0 ? floor(luniDay/cuc) : ceil(luniDay/cuc)) * cuc - luniDay) *((q==0 ? 0 : (q==0 ? floor(luniDay/cuc) : ceil(luniDay/cuc)) * cuc - luniDay) % 2 == 0 ? 1 : -1)",
//     "export": true
//   },
//   "liemTrinh": {
//     "expression": "tuVi + 4",
//   },
//   "thienDong": {
//     "expression": "tuVi + 7",
//   },
//   "vuKhuc": {
//     "expression": "tuVi + 8",
//   },
//   "thaiDuong": {
//     "expression": "tuVi + 9",
//   },
//   "thienCo": {
//     "expression": "tuVi + 11",
//   },
//   "thienPhu": {"expression": "tuVi < 5 ? 4-tuVi : 16-tuVi", "export": true},
//   "thaiAm": {
//     "expression": "thienPhu + 1",
//   },
//   "thamLang": {
//     "expression": "thienPhu + 2",
//   },
//   "cuMon": {
//     "expression": "thienPhu + 3",
//   },
//   "thienTuong": {
//     "expression": "thienPhu + 4",
//   },
//   "thienLuong": {
//     "expression": "thienPhu + 5",
//   },
//   "thatSat": {
//     "expression": "thienPhu + 6",
//   },
//   "phaQuan": {
//     "expression": "thienPhu + 10",
//   },
//   "truongSinh": {
//     "expression": "data[cuc-2]",
//     "data": [8, 11, 5, 8, 2],
//     "export": true
//   },
//   "mocDuc": {
//     "expression": "truongSinh + k * 1",
//   },
//   "quanDoi": {
//     "expression": "truongSinh + k * 2",
//   },
//   "lamQuan": {
//     "expression": "truongSinh + k * 3",
//   },
//   "deVuong": {
//     "expression": "truongSinh + k * 4",
//   },
//   "suy": {
//     "expression": "truongSinh + k * 5",
//   },
//   "benh": {
//     "expression": "truongSinh + k * 6",
//   },
//   "tu": {
//     "expression": "truongSinh + k * 7",
//   },
//   "mo": {
//     "expression": "truongSinh + k * 8",
//   },
//   "tuyet": {
//     "expression": "truongSinh + k * 9",
//   },
//   "thai": {
//     "expression": "truongSinh + k * 10",
//   },
//   "duong": {
//     "expression": "truongSinh + k * 11",
//   },
//   "locTon": {
//     "expression": "data[canOfYearIndex]",
//     "data": [2, 3, 5, 6, 5, 6, 8, 9, 11, 0],
//     "export": true
//   },
//   "anQuang": {
//     "expression": "10-hourIndex + luniDayIndex-1",
//   },
//   "bacSi": {
//     "expression": "data[canOfYearIndex]",
//     "data": [2, 3, 5, 6, 5, 6, 8, 9, 11, 0],
//   },
//   "bachHo": {
//     "expression": "chiOfYearIndex + 8",
//   },
//   "batToa": {
//     "expression": "10-luniMonthIndex-luniDayIndex",
//   },
//   "benhPhu": {
//     "expression": "locTon + k * 8",
//   },
//   "coThan": {
//     "expression": "data[chiOfYearIndex]",
//     "data": [2, 2, 5, 5, 5, 8, 8, 8, 11, 11, 11, 2],
//   },
//   "daLa": {
//     "expression": "locTon + 11",
//   },
//   "daiHao": {
//     "expression": "locTon + k * 9",
//   },
//   "daoHoa": {
//     "expression": "data[chiOfYearIndex]",
//     "data": [9, 6, 3, 0, 9, 6, 3, 0, 9, 6, 3, 0]
//   },
//   "dauQuan": {
//     "expression": "chiOfYearIndex - luniMonthIndex + hourIndex",
//   },
//   "diaGiai": {
//     "expression": "luniMonthIndex + 7",
//   },
//   "diaKhong": {
//     "expression": "11 - hourIndex",
//   },
//   "diaKiep": {
//     "expression": "11 + hourIndex",
//   },
//   "diaVong": {
//     "expression": "10",
//   },
//   "dieuKhach": {
//     "expression": "chiOfYearIndex + 10",
//   },
//   "duongPhu": {
//     "expression": "locTon + 5",
//   },
//   "giaiThan": {
//     "expression": "10 - chiOfYearIndex",
//   },
//   "hoaCai": {
//     "expression": "data[chiOfYearIndex]",
//     "data": [4, 1, 10, 7, 4, 1, 10, 7, 4, 1, 10, 7]
//   },
//   "hoaKhoa": {
//     "expression": "data[canOfYearIndex]",
//     "altData":
//         '[8+tuVi,tuVi,10-hourIndex,11+tuVi,10-luniMonthIndex,5+thienPhu,7+tuVi,4+hourIndex,4+luniMonthIndex,1+thienPhu]'
//   },
//   "hoaKy": {
//     "expression": "data[canOfYearIndex]",
//     "altData":
//         '[9+tuVi,1+thienPhu,4+tuVi,3+thienPhu,11+tuVi,4+hourIndex,1+thienPhu,10-hourIndex,8+tuVi,2+thienPhu]'
//   },
//   "hoaLoc": {
//     "expression": "data[canOfYearIndex]",
//     "altData":
//         '[4+tuVi,11+tuVi,7+tuVi,1+thienPhu,2+thienPhu,8+tuVi,9+tuVi,3+thienPhu,5+thienPhu,10+thienPhu]'
//   },
//   "hoaQuyen": {
//     "expression": "data[canOfYearIndex]",
//     "altData":
//         '[10+thienPhu,5+thienPhu,11+tuVi,7+tuVi,1+thienPhu,2+thienPhu,8+tuVi,9+tuVi,tuVi,3+thienPhu]'
//   },
//   "hoaTinh": {
//     "expression": "data[chiOfYearIndex] + k * hourIndex",
//     "data": [2, 3, 1, 9, 2, 3, 1, 9, 2, 3, 1, 9]
//   },
//   "hongLoan": {
//     "expression": "3 - chiOfYearIndex",
//   },
//   "huuBat": {
//     "expression": "10 - luniMonthIndex",
//   },
//   "hyThan": {
//     "expression": "locTon + k * 7",
//   },
//   "kiepSat": {
//     "expression": "data[chiOfYearIndex]",
//     "data": [5, 2, 11, 8, 5, 2, 11, 8, 5, 2, 11, 8]
//   },
//   "kinhDuong": {
//     "expression": "locTon + 1",
//   },
//   "linhTinh": {
//     "expression": "data[chiOfYearIndex] - k * hourIndex",
//     "data": [10, 10, 3, 10, 10, 10, 3, 10, 10, 10, 3, 10]
//   },
//   "longDuc": {
//     "expression": "chiOfYearIndex + 7",
//   },
//   "longTri": {
//     "expression": "chiOfYearIndex + 4",
//   },
//   "lucSi": {
//     "expression": "locTon + k",
//   },
//   "luuHa": {
//     "expression": "data[canOfYearIndex]",
//     "data": [9, 10, 7, 4, 5, 6, 8, 3, 11, 2]
//   },
//   "luuNienVanTinh": {
//     "expression": "data[canOfYearIndex]",
//     "data": [5, 6, 8, 9, 8, 9, 11, 0, 9, 3]
//   },
//   "nguyetDuc": {
//     "expression": "chiOfYearIndex + 5",
//   },
//   "phaToai": {
//     "expression": "data[chiOfYearIndex]",
//     "data": [5, 1, 9, 5, 1, 9, 5, 1, 9, 5, 1, 9],
//   },
//   "phiLiem": {
//     "expression": "locTon + k * 6",
//   },
//   "phongCao": {
//     "expression": "hourIndex + 4 - 2",
//   },
//   "phucBinh": {
//     "expression": "locTon + k * 10",
//   },
//   "phucDuc": {
//     "expression": "chiOfYearIndex + 9",
//   },
//   "phuongCac": {
//     "expression": "10 - chiOfYearIndex",
//   },
//   "quaTu": {
//     "expression": "data[chiOfYearIndex]",
//     "data": [10, 10, 1, 1, 1, 4, 4, 4, 7, 7, 7, 10],
//   },
//   "quanPhuf": {
//     "expression": "chiOfYearIndex + 4",
//   },
//   "quanPhur": {
//     "expression": "locTon + k * 11",
//   },
//   "quocAn": {
//     "expression": "locTon + 8",
//   },
//   "taPhu": {
//     "expression": "luniMonthIndex + 4",
//   },
//   "tamThai": {
//     "expression": "luniMonthIndex + luniDayIndex + 4",
//   },
//   "tangMon": {
//     "expression": "chiOfYearIndex + 2",
//   },
//   "tauThu": {
//     "expression": "locTon + k * 5",
//   },
//   "thaiPhu": {
//     "expression": "hourIndex + 4 + 2",
//   },
//   "thaiTue": {
//     "expression": "chiOfYearIndex",
//   },
//   "thanhLong": {
//     "expression": "locTon + k * 2",
//   },
//   "thienDuc": {
//     "expression": "chiOfYearIndex + 9",
//   },
//   "thienGiai": {
//     "expression": "luniMonthIndex + 8",
//   },
//   "thienHi": {
//     "expression": "3 - chiOfYearIndex - 6",
//   },
//   "thienHinh": {
//     "expression": "luniMonthIndex + 9",
//   },
//   "thienHu": {
//     "expression": "chiOfYearIndex + 6",
//   },
//   "thienKhoc": {
//     "expression": "6 - chiOfYearIndex",
//   },
//   "thienKhoi": {
//     "expression": "data[chiOfYearIndex]",
//     "data": [1, 0, 11, 11, 1, 0, 6, 6, 3, 3],
//   },
//   "thienKhong": {
//     "expression": "chiOfYearIndex + 1",
//   },
//   "thienLa": {
//     "expression": "4",
//   },
//   "thienMa": {
//     "expression": "data[chiOfYearIndex]",
//     "data": [2, 11, 8, 5, 2, 11, 8, 5, 2, 11, 8, 5],
//   },
//   "thienPhuc": {
//     "expression": "data[canOfYearIndex]",
//     "data": [9, 8, 0, 11, 3, 2, 6, 5, 6, 5],
//   },
//   "thienQuan": {
//     "expression": "data[canOfYearIndex]",
//     "data": [7, 4, 5, 2, 3, 9, 11, 9, 10, 6],
//   },
//   "thienQuy": {
//     "expression": "hourIndex-luniDayIndex + 4 + 1",
//   },
//   "thienRieu": {
//     "expression": "luniMonthIndex + 1",
//   },
//   "thienSu": {
//     "expression": "posOfMenh + 7",
//   },
//   "thienTai": {
//     "expression": "posOfMenh + chiOfYearIndex",
//   },
//   "thienTho": {
//     "expression": "posOfThan + chiOfYearIndex",
//   },
//   "thienThuong": {
//     "expression": "posOfMenh + 5",
//   },
//   "thienTru": {
//     "expression": "data[canOfYearIndex]",
//     "data": [5, 6, 0, 5, 6, 8, 2, 6, 9, 10],
//   },
//   "thienViet": {
//     "expression": "data[canOfYearIndex]",
//     "data": [7, 8, 9, 9, 7, 8, 2, 2, 5, 5],
//   },
//   "thienY": {
//     "expression": "luniMonthIndex + 1",
//   },
//   "thieuAm": {
//     "expression": "canOfYearIndex + 3",
//   },
//   "thieuDuong": {
//     "expression": "chiOfYearIndex + 1",
//   },
//   "tieuHao": {
//     "expression": "locTon + k * 3",
//   },
//   "trucPhu": {
//     "expression": "chiOfYearIndex + 11",
//   },
//   "tuPhu": {
//     "expression": "chiOfYearIndex + 5",
//   },
//   "tuePha": {
//     "expression": "chiOfYearIndex + 6",
//   },
//   "tuongQuan": {
//     "expression": "locTon + k * 4",
//   },
//   "vanKhuc": {
//     "expression": "hourIndex + 4",
//   },
//   "vanXuong": {
//     "expression": "10 - hourIndex",
//   },
//   "luuLocTon": {
//     "expression": "data[canOfWatchingYearIndex]",
//     "data": [2, 3, 5, 6, 5, 6, 8, 9, 11, 0],
//     "export": true
//   },
//   "luuBachHo": {
//     "expression": "chiOfWatchingYearIndex + 8",
//   },
//   "luuDaLa": {
//     "expression": "luuLocTon + 11",
//   },
//   "luuKinhDuong": {
//     "expression": "luuLocTon + 1",
//   },
//   "luuTangMon": {
//     "expression": "chiOfWatchingYearIndex + 2",
//   },
//   "luuThaiTue": {
//     "expression": "chiOfWatchingYearIndex",
//   },
//   "luuThienHu": {
//     "expression": "chiOfWatchingYearIndex + 6",
//   },
//   "luuThienKhoc": {
//     "expression": "6 - chiOfWatchingYearIndex",
//   },
//   "luuThienMa": {
//     "expression": "data[chiOfWatchingYearIndex]",
//     "data": [2, 11, 8, 5, 2, 11, 8, 5, 2, 11, 8, 5],
//     "export": true
//   },
// };
