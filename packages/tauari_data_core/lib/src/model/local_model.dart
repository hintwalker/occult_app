import 'model.dart';
import 'sqlite_storable.dart';

abstract class LocalModel<E> extends Model<E> implements SqliteStorable {
  const LocalModel();
}
