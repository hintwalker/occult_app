part of tauari_auth;

class UserEntity implements CloudStorable, Dumpable {
  final String? id;
  final String? displayName;
  final String? photoUrl;
  final String? email;
  final int? lastSeen;
  final String? status;
  final int? created;
  final String? banned;
  const UserEntity({
    this.id,
    required this.displayName,
    required this.email,
    this.photoUrl,
    this.lastSeen,
    this.status,
    this.created,
    this.banned,
  });

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map[columnId],
      displayName: map[ColumnUser.displayName],
      photoUrl: map[ColumnUser.photoUrl],
      email: map[ColumnUser.email],
      status: map[ColumnUser.email],
      lastSeen: map[ColumnUser.lastSeen],
      banned: map[ColumnUser.banned],
    );
  }

  Map<String, dynamic> toMap() {
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

  UserEntity copyWith(
      {String? id,
      String? displayName,
      String? photoUrl,
      String? email,
      String? status,
      int? lastSeen,
      String? banned}) {
    return UserEntity(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      status: status ?? this.status,
      lastSeen: lastSeen ?? this.lastSeen,
      banned: banned ?? this.banned,
    );
  }

  Map<String, Object?> toFirestore() {
    return {
      ColumnUser.displayName: displayName,
      ColumnUser.photoUrl: photoUrl,
      ColumnUser.email: email,
      ColumnUser.status: status,
      ColumnUser.lastSeen: lastSeen,
      ColumnUser.banned: banned
    };
  }

  String get uidInFirestore {
    return email != null
        ? email!.replaceAll(RegExp(r'@'), '.')
        : DateTime.now().toString();
  }

  @override
  String get docId => uidInFirestore;

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
}
