part of lasotuvi_chart;

class ChartDetailWidget extends StatelessWidget {
  const ChartDetailWidget(
    this.data, {
    super.key,
    required this.translate,
    required this.colorScheme,
  });
  final Chart data;
  final String Function(String) translate;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: AppBar(
            titleSpacing: 0,
            title: Text(data.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: colorScheme.primary,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 1.4,
                )),
            actions: [
              IconButton(icon: const Icon(Icons.search), onPressed: () {})
            ]),
      ),
      body: TuviChartContainer(data,
          translate: translate, colorScheme: colorScheme),
    );
  }
}
