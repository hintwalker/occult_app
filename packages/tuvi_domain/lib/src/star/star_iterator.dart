import 'star_name.dart';

class StarIterator implements Iterator<StarName> {
  final List<StarName> _priorityList;
  StarIterator(this._priorityList);

  List<StarName> cloneStars() => List.from(_priorityList);

  void remove(StarName star) {
    _priorityList.remove(star);
  }

  List<StarName> get priorityList => _priorityList;
  int _cursor = 0;

  @override
  StarName get current => _priorityList[_cursor++];

  @override
  bool moveNext() {
    return _cursor < _priorityList.length;
  }

  void reset() {
    _cursor = 0;
  }
}
