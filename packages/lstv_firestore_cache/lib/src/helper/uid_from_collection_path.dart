///
/// Chỉ sử dụng được khi uid nằm giữa 2 ký tự '/' đầu tiên
///
String? uidFromCollectionPath(String path) {
  final RegExp exp = RegExp(r"(?<=\/)(.*?)(?=\/)");
  return exp.firstMatch(path)?[0];
}
