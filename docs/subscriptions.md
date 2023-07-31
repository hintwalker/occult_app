
Mỗi lần đăng ký có thời hạn 30 ngày.

Hệ thống tự động gia hạn sau khi hết hạn. Hệ thống tự động trừ điểm năng lượng của người dùng.

Khi Hệ thống nhận thấy thời hạn của gói đăng ký đã hết, hệ thống tự động áp dụng gói miễn phí cho người dùng, đồng thời chuyển trạng thái gói đăng ký sang "expired". Ở trạng thái này, người dùng sẽ bị giới hạn truy cập dữ liệu theo gói miễn phí.

Trạng thái expired tồn tại trong 7 ngày. Sau thời gian này, nếu người dùng không gia hạn hoặc đăng ký gói mới, mọi dữ liệu dôi dư của người dùng sẽ bị xóa.

Tại thời điểm gia hạn, hoặc sau đó dưới 7 ngày, hệ thống kiểm tra nếu người dùng đã hủy gia hạn (trạng thái cancelExtend) thì tự động chuyển sang trạng thái canceled. Nếu người dùng chưa hủy gia hạn, thì hệ thống thử thực hiện gia hạn tự động. Nếu gia hạn tự động không thành công, thì chuyển sang trạng thái canceled.

Mở app -> Kiểm tra đăng nhập -> lấy thông tin gói đăng ký hiện tại -> kiểm tra ngày hết hạn -> Hiển thị ngày hết hạn.

Nếu ngày hết hạn lớn hơn ngày hiện tại 7 ngày -> (trạng thái hủy đăng ký), -> Hệ thống tự động hủy đăng ký, xóa toàn bộ dữ liệu dôi dư.

Trong trường hợp gói đăng ký hiện tại chưa hết hạn, người dùng muốn đăng ký gói khác, thì có 2 trường hợp:
  - Nâng cấp: Hệ thống thu phí gói mới trừ đi phần tiền tương ứng với thời gian đã sử dụng gói cũ. Cập nhật lại giới hạn truy cập dữ liệu.
  - Hạ cấp: Hệ thống tính số tiền ứng với thời gian sử dụng gói hiện tại, sau đó tính phần tiền còn thừa. Hệ thống thu tiền gói mới trừ đi tiền còn thừa. Cập nhật lại giới hạn dữ liệu.

Các trạng thái của 1 gói đăng ký:
  - Hoạt động (actived) (đang áp dụng, còn thời hạn)
  - Hết hạn (expired) (không áp dụng, có thể gia hạn, dữ liệu dôi dư chưa bị xóa)
  - Hủy gia hạn (cancelExtend) (còn áp dụng, không tự động gia hạn khi hết hạn,)
  - Đã hủy (canceled) (không còn áp dụng, đã hủy, dữ liệu dôi dư đã bị xóa.)
  - Chưa đăng ký (alone)

Tiến trình trạng thái của 1 gói đăng ký:
1. Đăng ký lần đầu và không hủy gia hạn trước khi hết hạn: alone -> actived -> (expired -> actived) -> canceled
2. Đăng ký lần đầu và hủy gia hạn: alone -> actived -> cancelExtend -> expired -> canceled

Giao diện action trong 1 gói đăng ký (Không free):
  - actived: Nút hủy gia hạn, thời điểm hết hạn, thông báo đang sử dụng.
  - waitingExtend: Nút hủy đăng ký, nút gia hạn, thời điểm giới hạn truy cập dữ liệu, thông báo đang sử dụng
  - waitingCancel: Nút hủy đăng ký, nút gia hạn, thời điểm xóa dữ liệu dôi dư.
  - canceled: Nút đăng ký, thời điểm hủy
  - alone: Nút đăng ký.

Giao diện action đối với plan free:
  - actived: thông báo đang sử dụng
  - alone: Nút đăng ký.

Điều kiện để gói đăng ký rơi vào 1 trạng thái:
  - active: expiredDate <= now
  - waitingExtend: expiredDate > now && expiredDate - now <= 3 days



CurrentSubController: cung cấp stream về dữ liệu đăng ký hiện tại.

Các widget sử dụng CurrentSubController thông qua provider:
  - AllStoragePlansBody: Body cho widget hiển thị tất cả gói lưu trữ
  - CurentSubWidgetController

Widget sử dung CurrentSubController trực tiếp:
  - LiveStoragePlanListWidget: Hiển thị tất cả gói lưu trữ

[Không áp dụng nữa]

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
