# LIBRARY

Danh sách danh mục các tài liệu nằm trong biến

Các file được lưu trữ trong Firebase Storage. Khi user mở file, nếu có nối mạng, file luôn được tải về thiết bị, để bảo đảm nội dung luôn được cập nhật.

Khi user mở file mà không có nối , app load nội dung từ file trong thiết bị

Quy trình mở file

o -> Kiểm tra file trên thiết bị 
    - Nếu không có thì tải file từ firebase, và lưu file về thiết bị
    - Nếu có thì mở file từ thiết bị.


