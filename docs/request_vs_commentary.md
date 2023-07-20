Request: Yêu cầu luận giải được gửi bởi người dùng
Commentary: Luận giải được gửi từ admin

Quan hệ Request - Commentary: 1 - n

Ứng với 1 request, admin có thể gửi nhiều commentary.

Request có các thuộc tính giống Chart, có thêm solved (int: 0: unSolved, 1: solved)

Mỗi khi user gửi yêu cầu, request được tạo và thêm lên cloud, với thuộc tính solved = 0. App admin theo dõi các request của từng user, nếu request nào có solved = 0 thì đánh dấu thông báo trên request đó.

Sau khi admin gửi luận giải, commentary được tạo vào collection tương ứng với uid đã gửi request, đánh dấu solved = 1 cho request, đồng thời thêm 1 thông báo Notification vào danh sách thông báo. App lasotuvi theo dõi các request, nếu request nào có solved = 1 thì đánh dấu thông báo trên request đó.