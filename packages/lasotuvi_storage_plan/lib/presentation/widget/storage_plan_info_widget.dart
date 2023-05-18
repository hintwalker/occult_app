part of lasotuvi_storage_plan;

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
                      const Icon(Icons.cloud),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text('${translate('storagePlan')}:'),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          color: style.infoBackgroundColor,
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Row(children: [
                          Text(data.title),
                          const SizedBox(
                            width: 8.0,
                          ),
                          energyIcon,
                          Text('${data.energy} /${translate('day')}')
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
