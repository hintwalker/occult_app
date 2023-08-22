Sử dụng Hive làm lớp dữ liệu trung gian cho Firestore.

App đọc tất cả dữ liệu từ Firestore (dạng Future) của user đã đăng nhập 1 lần khi mở, sau đó ghi dữ liệu vào Hive. App truy xuất dữ liệu từ Hive trong suốt quá trình sử dụng. Khi chỉnh sửa dữ liệu đã đồng bộ, hoặc upload dữ liệu, app ghi dữ liệu vào Hive lẫn Firestore.

Gọi hàm đọc dữ liệu Firestore và ghi vào Hive từ trang splash hoặc hàm main.

Mỗi khi dữ liệu có thay đổi, app chỉ refresh lại nơi chứa dữ liệu cần thiết, không refresh lại toàn bộ cơ sở dữ liệu.

## Mối liên hệ giữa thao tác dữ liệu và refresh

| Action | Refresh | Note |
| --- | --- | --- |
| Tạo chart | chart | |
| Xóa chart | chart, chart_tag, note | Khi xóa chart: note bị xóa theo, nếu có gắn tag, thì mối liên hệ với tag bị xóa.
| Sửa chart | chart | |
| Gắn tag | chart_tag | |
| Gỡ tag | chart_tag | |
| Tạo tag | tag | |
| Xóa tag | tag, chart_tag | |
| Sửa tag | tag | | 
| Tạo note | note | |
| Xóa note | note | |
| Sửa note | note | |

# Cấu trúc dữ liệu cache

Gồm các box:
energy, tuviChart, tuviTag, tuviNote, storagePlan, subscription

## Box energy

Kiểu Map
  - key: v
  - value: [int]

Đường dẫn đọc dữ liệu từ firestore:

collection('e').doc({uid}).collection('e').doc('i')

## Box tuviChart

Kiểu Map
  - key: {docId}
  - value: Map: {name: [String], birthday: [int], lastViewed: [int], watchingYear: [int], timeZone: [int]}

Đường dẫn đọc dữ liệu từ firestore:

collection('tuvi').doc({uid}).collection('c')

# Hình thức thực hiện

Thay lớp FirestoreService hiện tại thành FirestoreServiceCache

Các lớp bị ảnh hưởng:

  - ChartFirestoreService
  - TagFirestoreService
  - NoteFirestoreService
  - ChartTagFirestoreService
  - CommentaryFirestoreService
  - NotificationFiretoreService
  - RequestFirestoreService
  - EnergyFirestoreService
  - StoragePlanFirestoreService
  - SubscriptionFirestoreService

Các lớp kể trên phải thay đổi lớp mà chúng kế thừa, từ FirestoreService sang FirestoreServiceCache.


# Tasks

## Tạo class FirestoreServiceCache trong lstv_firestore_cache

FirestoreServiceCache phải kế thừa lớp CloudService (import từ package tauari_data_core)

Đặt updateTriggerController ở FirestoreServiceCache.

- Tải dữ liệu firestore và lưu cache ở màn hình splash
- Khi offline thì sử dụng cache cũ, không tải dữ liệu từ firestore
- Chuyển data source sang cache khi load
- Cập nhật dữ liệu lên cache và firestore.




