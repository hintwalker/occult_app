import '../entity/dumpable.dart';

abstract class Model<E> implements Dumpable {
  const Model();
  E toEntity();
}
