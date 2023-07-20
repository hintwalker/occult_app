Notification chỉ được gửi từ admin, để thông báo cho user biết thông tin mới. Có 2 loại thông tin: Loại có thể tap và loại không thể tap.

Loại có thể tap gồm:
- Có luận giải mới --> khi tap vào sẽ hiển thị màn hình chi tiết luận giải.
- Thông báo sắp đến hạn gia hạn gói lưu trữ, sắp đến thời điểm dữ liệu bị xóa --> chuyển đến mà hình gói đăng ký

Loại không thể tap
- Thông báo tin nhắn từ admin đến user.

Danh sách notification hiển thị có giới hạn (10 tin gần nhất) ở bottom sheet. Và có thể xem toàn bộ. Có thể tìm kiếm theo tiêu đề.

Cấu trúc dữ liệu trên local:

- id
- title
- content
- type
- url
- created
- seen


