part of lasotuvi_chart;

abstract class ModifyState<T, W extends StatefulWidget> extends State<W> {
  bool valid = true;
  T? value;
}
