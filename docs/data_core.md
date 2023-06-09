## Kiến trúc

Sử dụng kiến trúc clean, gồm các thành tố sau:
- Entity
- Model
- Repository
- DataSource
- Dao
- Service
- UseCase

Sử dụng cơ sở dữ liệu Sqlite cho local và Firebase cho cloud

## Entity

Các interface dùng cho entity:
- Dumpable: Có thể xuất dạng `Map<String, Object>`
    - dump()
- CloudGetable: Có thể xác định trên cloud
    - docId: String
- Sortable: Có thể sắp xếp được
    - sortId: String
- SqliteGetable: Có thể xác định trong sqlite
    - primaryKey: String
- Statable<T>: Có thể thay đổi trạng thái
    - state: String?
    - copyWithState(String?): T
- Syncable<T> -> Sortable: Có thể đồng bộ dữ liệu lên cloud
    - getSyncStatus: String?
    - copyWithSyncStatus(String?): T

Các loại Entity:
- Entity -> Dumpable: Entity gốc
- SyncableEntity<T> -> Entity, Syncable<T>, CloudGetable, SqliteGetable, Statable<T>: Entity có thể đồng bộ

Các lớp hỗ trợ:
- SetOfEntity<T extends Syncable>: Nhóm các lớp SyncableEntity
- PoolSetOfEntity<T extends Syncable>: gồm 2 nhóm SetOfEntity, 1 cho local và 1 cho cloud. Có nhiệm vụ gộp 2 nhóm và đưa ra 1 nhóm có chứa thông tin đồng bộ.

## Model

Các interface dùng cho model:
- CloudStorable: Có thể ghi vào cloud
    - toCloud(): `Map<String, Object?>`
- SqliteStorable: Có thể ghi vào sqlite
    - toSqlite(): `Map<String, Object?>`

Các loại model:
- Model<E>> -> Dumpable: Lớp model gốc
    - toEntity(): E
- CloudModel<E> -> Model<E>, CloudStorable: Lớp model dùng cho dữ liệu lưu trên cloud 
- LocalModel<E> -> Model<E>, SqliteStorable: Lớp model dùng cho dữ liệu lưu trên sqlite
- SyncableModel<E extends SyncalbleEntity> -> LocalModel<E>, CloudModel<E>: Lớp model dùng cho dữ liệu có thể đồng bộ


