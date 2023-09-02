# Thử chức năng cập nhật in-app

Tham khảo tại: https://developer.android.com/guide/playcore/in-app-updates/test

và tại đây: https://support.google.com/googleplay/android-developer/answer/9844679#zippy=%2Cupload-and-share-apps-for-testing

Dùng thư viện: https://pub.dev/packages/in_app_update

Tóm tắt các bước:

- Thêm chức năng cập nhật in-app
- Upload lên Play Console dạng internal-app-sharing tại: https://play.google.com/console/u/0/internal-app-sharing (Ví dụ đặt phiên bản 1.0.0)
- Cài đặt bản này lên máy thử nghiệm (cài đặt theo đường dẫn Play Console cung cấp sau khi upload)
- Thay đổi app (thêm chức năng), thay đổi version trong pubspec. Sau đó upload lên Play Console dạng internal-app-sharing phiên bản mới (ví dụ đặt là 1.0.1)
- Mở đường dẫn app version mới nhưng không cài đặt
- Mở app version cũ, khi đó chức năng update in-app sẽ hoạt động.