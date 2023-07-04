part of lasotuvi_chart;

class ChartModificationOptionsBuilder extends StatelessWidget {
  const ChartModificationOptionsBuilder(
      {super.key,
      required this.controller,
      required this.uid,
      required this.docId,
      required this.syncStatus,
      required this.child});
  final String? uid;
  final int docId;
  final String? syncStatus;
  final Widget Function(Chart) child;
  final ChartDetailController controller;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller.stream(uid: uid, docId: docId, syncStatus: syncStatus),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingWidget();
        } else if (snapshot.hasData) {
          if (snapshot.requireData == null) {
            return const ErrorTextWidget();
          }
          return child(snapshot.requireData!);
        } else {
          return const ErrorTextWidget();
        }
      }),
    );
  }
}
