## Đọc dữ liệu là file md từ Firebase storage

Thông tin mỗi sao được lưu dưới dạng 1 file md, lưu trong Storage theo đường dẫn: /tuvi/stars/*.md

Với user đã đăng nhập, app tải file về thiết bị, sau đó hiển thị cho người dùng.

Trước khi tải, app kiểm tra file đã có chưa trên thiết bị. Nếu đã có, app hiển thị nội dung từ file đã tải.


## diary

flutter pub add firebase_storage
flutter pub add flutter_markdown

Nội dung của file tải từ storage sẽ trả về kiểu Uint8List. Muốn chuyển sang kiểu String phải gọi hàm sau: 

```
final String stringData = Utf8Decoder().convert(data) 
```
Trong đó data có kiểu Uint8List
