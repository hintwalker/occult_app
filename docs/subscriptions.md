Mỗi gói đăng ký có thời hạn 30 ngày.
Khi mở app, ở màn hình home, có timer đếm thời gian còn lại đến ngày thanh toán.
  - Nếu đúng ngày thanh toán, thực hiện thanh toán và cập nhật lại thời hạn thanh toán mới
  - Nếu đã vượt quá ngày thanh toán, chi phí thanh toán được tính nhân với 1 + kết quả của thời gian vượt quá chia cho 30 lấy phần nguyên. Thực hiện thanh toán. 
    - Nếu chỉ đủ tiền thanh toán cho 1 phần. Vẫn thanh toán, cập nhật lại thời điểm hết hạn là ngày tương ứng với phần đã thanh tóan. Chuyển trạng thái là đã hết hạn.
    - Nếu đã thanh toán 1 phần, mà thời gian còn lại cũng vượt quá thời hạn xóa dữ liệu, thì thông báo cho user để quyết định thanh toán hay tiếp tục xóa dữ liệu. Nếu user chọn thanh toán, thì điều hướng user đến mua điểm năng lượng để thanh toán. Nếu user chọn xóa dữ liệu thì dữ liệu bị xóa ngay lập tức.
Trong thời gian hết hạn, user được áp dụng gói miễn phí. Các dữ liệu dôi dư không được hiển thị.

Timer KHÔNG CẦN chạy background xuyên suốt vòng đời của app.

Các screen có timer:
  - Home
  - Storage plans
