enum ListOrder {
  asc,
  desc;

  static ListOrder fromString(String name) {
    if (name.toLowerCase().compareTo('asc') == 0) {
      return ListOrder.asc;
    } else {
      return ListOrder.desc;
    }
  }
}
