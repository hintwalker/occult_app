part of tauari_auth;

class UserModel extends CloudModel<UserEntity> {
  final String? id;
  final String? displayName;
  final String? photoUrl;
  final String? email;
  final int? lastSeen;
  final String? status;
  final int? created;
  final String? banned;

  const UserModel({
    this.id,
    required this.displayName,
    required this.email,
    this.photoUrl,
    this.lastSeen,
    this.status,
    this.created,
    this.banned,
  });

  @override
  String get docId => email != null
      ? email!.replaceAll(RegExp(r'@'), '.')
      : DateTime.now().toString();

  @override
  Map<String, Object?> dump() {
    return {
      columnId: id,
      ColumnUser.displayName: displayName,
      ColumnUser.photoUrl: photoUrl,
      ColumnUser.email: email,
      ColumnUser.status: status,
      ColumnUser.lastSeen: lastSeen,
      ColumnUser.banned: banned
    };
  }

  @override
  Map<String, Object?> toCloud() {
    return {
      ColumnUser.displayName: displayName,
      ColumnUser.photoUrl: photoUrl,
      ColumnUser.email: email,
      ColumnUser.status: status,
      ColumnUser.lastSeen: lastSeen,
      ColumnUser.banned: banned
    };
  }

  @override
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      displayName: displayName,
      photoUrl: photoUrl,
      email: email,
      status: status,
      lastSeen: lastSeen,
      banned: banned,
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      displayName: entity.displayName,
      photoUrl: entity.photoUrl,
      email: entity.email,
      status: entity.status,
      lastSeen: entity.lastSeen,
      banned: entity.banned,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map[columnId],
      displayName: map[ColumnUser.displayName],
      photoUrl: map[ColumnUser.photoUrl],
      email: map[ColumnUser.email],
      status: map[ColumnUser.email],
      lastSeen: map[ColumnUser.lastSeen],
      banned: map[ColumnUser.banned],
    );
  }
}
