part of energy_store;

enum ProductIds {
  ev0(0),
  ev50(50),
  ev100(100),
  ev200(200),
  ev500(500),
  ev1k(1000),
  ev2k(2000);

  const ProductIds(this.point);
  final int point;

  static List<ProductIds> availableList() => values;

  static ProductIds fromProductId(String id) {
    return ProductIds.values.firstWhere((element) => element.name == id);
  }
}
