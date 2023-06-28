part of tuvi_chart_diagram;

class GridController extends ChangeNotifier {
  final Map<HousePosition, HouseController> houseControllers = {};
  HousePosition currentSelectedSource = HousePosition.unknown();
  void insert(HouseController controller) {
    houseControllers[controller.house.position] = controller;
    controller.attachTo(this);
  }

  void select(House house) {
    clearAllSelected();
    if (currentSelectedSource != house.position) {
      currentSelectedSource = house.position;
      // final HousePair pair = house.findPair();
      final HouseTriad triad = house.findTriad();
      final HousePair opposition = house.findOpposition();
      houseControllers[house.position]?.enableSelected();
      houseControllers[house.position]?.enableSource();
      // selectPair(pair, true);
      selectTriad(triad, true);
      selectOpposition(opposition, true);
    } else {
      currentSelectedSource = HousePosition.unknown();
    }
  }

  void listen() {
    // houseControllers.forEach((key, value) {
    //   value.addListener(() => onHouseChanged(value));
    // });
  }

  // void onHouseChanged(HouseController controller) {
  //   if (!controller.source || _pauseListening) {
  //     return;
  //   }
  //   final selected = controller.selected;
  //   clearAllSelected();
  //   if (selected) {
  //     currentSelectedSource = controller.currentPosition;
  //   } else {
  //     currentSelectedSource = HousePosition.unknown();
  //   }
  //   final HousePair pair = controller.house.findPair();
  //   final HouseTriad triad = controller.house.findTriad();
  //   final HousePair opposition = controller.house.findOpposition();
  //   selectPair(pair, selected);
  //   selectTriad(triad, selected);
  //   selectOpposition(opposition, selected);
  // }

  @override
  void dispose() {
    // houseControllers.forEach((key, value) {
    //   value.removeListener(() => onHouseChanged(value));
    //   houseControllers.remove(key);
    // });
    super.dispose();
  }

  void clearAllSelected() {
    houseControllers.forEach((key, value) {
      value.unselect();
    });
  }

  void selectPair(HousePair pair, bool selected) {
    houseControllers[pair.other]?.select(selected, false);
  }

  void selectTriad(HouseTriad triad, bool selected) {
    houseControllers[triad.nextClockWise]?.select(selected, false);
    houseControllers[triad.other]?.select(selected, false);
  }

  void selectOpposition(HousePair opposition, bool selected) {
    houseControllers[opposition.other]?.select(selected, false);
  }
}
