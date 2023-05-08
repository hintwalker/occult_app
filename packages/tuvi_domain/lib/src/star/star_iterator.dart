part of tuvi_domain;

class StarIterator implements Iterator<StarName> {
  final List<StarName> _priorityList;
  StarIterator(this._priorityList);

  List<StarName> get priorityList => _priorityList;
  int _cursor = 0;

  @override
  StarName get current => _priorityList[_cursor++];

  @override
  bool moveNext() {
    return _cursor < _priorityList.length;
  }
}
