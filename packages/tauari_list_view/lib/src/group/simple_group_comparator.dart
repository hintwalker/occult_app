import '../entity/sort_value.dart';
import '../list_order.dart';
import '../simple_text_group.dart';

int simpleGroupComparator(
  SimpleTextGroup group1,
  SimpleTextGroup group2,
  SortValue? sortValue,
) {
  if (sortValue == null || sortValue.order == ListOrder.asc) {
    return group1.data.toLowerCase().compareTo(group2.data.toLowerCase());
  } else {
    return group2.data.toLowerCase().compareTo(group1.data.toLowerCase());
  }
}
