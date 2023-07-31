import 'package:flutter/material.dart';
import 'package:tauari_utils/tauari_utils.dart';

import '../../usecase/take_storage_plan_by_id.dart';
import '../style/storage_plan_style.dart';

class StoragePlanInfoWidget extends StatelessWidget {
  const StoragePlanInfoWidget({
    super.key,
    this.uid,
    required this.planId,
    required this.style,
    required this.translate,
    required this.takeStoragePlanById,
    required this.energyIcon,
  });
  final String? uid;
  final String planId;
  final String Function(String) translate;
  final StoragePlanStyle style;
  final TakeStoragePlanById takeStoragePlanById;
  final Widget energyIcon;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: takeStoragePlanById.call(uid, planId),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator.adaptive();
          } else if (snapshot.hasData) {
            final data = snapshot.requireData;
            return data == null
                ? const SizedBox.shrink()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cloud,
                        color: style.iconColor,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        '${translate('storagePlan')}:',
                        style: style.title,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: style.iconColor),
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Row(children: [
                          Text(
                            data.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          energyIcon,
                          data.energy == 0
                              ? Text(translate('free'))
                              : Text('${data.energy} /30 ${translate('day')}')
                        ]),
                      )
                    ],
                  );
          } else {
            return const SimpleErrorWidget();
          }
        });
  }
}
