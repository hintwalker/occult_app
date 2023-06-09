import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../listing/product_ids.dart';
import 'energy_list_item.dart';

class EnergyStoreWidget extends StatelessWidget {
  const EnergyStoreWidget({
    super.key,
    required this.products,
    required this.colorScheme,
    required this.translate,
    required this.onItemTap,
  });
  final List<ProductDetails> products;
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final void Function(ProductDetails) onItemTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => EnergyListItem(
            ev: ProductIds.fromProductId(products[index].id).point.toString(),
            price: products[index].price,
            colorScheme: colorScheme,
            onTap: () => onItemTap(products[index]),
            translate: translate),
        separatorBuilder: (ctx, index) => const Divider(
              height: 1.0,
            ),
        itemCount: products.length);
  }
}
