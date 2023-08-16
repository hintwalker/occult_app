// import 'package:energy_store/src/presentation/widget/live_energy_widget.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../listing/product_ids.dart';
import '../controller/energy_widget_controller.dart';
import '../style/live_energy_style.dart';
import 'energy_list_item.dart';

class EnergyStoreWidget extends StatelessWidget {
  const EnergyStoreWidget({
    super.key,
    required this.products,
    required this.colorScheme,
    required this.translate,
    required this.onItemTap,
    required this.energyController,
    required this.energyStyle,
    required this.uid,
  });
  final List<ProductDetails> products;
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final void Function(ProductDetails) onItemTap;
  final EnergyWidgetController energyController;
  final LiveEnergyStyle energyStyle;
  final String? uid;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Card(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(
        //       horizontal: 8.0,
        //       vertical: 12.0,
        //     ),
        //     child: Row(
        //       children: [
        //         Text(translate('yourEnergy')),
        //         const SizedBox(
        //           width: 8.0,
        //         ),
        //         LiveEnergyWidget(
        //             controller: energyController,
        //             style: energyStyle,
        //             uid: uid,
        //             onTap: () {}),
        //       ],
        //     ),
        //   ),
        // ),
        // const SizedBox(
        //   height: 8.0,
        // ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => EnergyListItem(
                  ev: ProductIds.fromProductId(products[index].id)
                      .point
                      .toString(),
                  price: products[index].price,
                  colorScheme: colorScheme,
                  onTap: () => onItemTap(products[index]),
                  translate: translate),
              separatorBuilder: (ctx, index) => const Divider(
                    height: 1.0,
                  ),
              itemCount: products.length),
        ),
      ],
    );
  }
}
