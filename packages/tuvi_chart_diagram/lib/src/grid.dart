import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import 'dia_ban/dia_ban_section.dart';
import 'grid_controller.dart';
import 'house/house_controller.dart';
import 'house/widgets/tuvi_house_container.dart';

class TuviChartGrid extends StatefulWidget {
  const TuviChartGrid(
    this.chart, {
    super.key,
    required this.translate,
    required this.colorScheme,
    required this.controller,
    required this.humanBio,
  });
  final TuViChart chart;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final GridController controller;
  final HumanBio humanBio;

  @override
  State<StatefulWidget> createState() => _TuviChartGridState();
}

class _TuviChartGridState extends State<TuviChartGrid> {
  // ConstraintId boxTyj = ConstraintId('boxTyj');
  // ConstraintId boxNgo = ConstraintId('boxNgo');
  // ConstraintId boxMui = ConstraintId('boxMui');
  // ConstraintId boxThan = ConstraintId('boxThan');

  // ConstraintId boxThin = ConstraintId('boxThin');
  // ConstraintId boxDau = ConstraintId('boxDau');

  // ConstraintId boxMao = ConstraintId('boxDao');
  // ConstraintId boxTuat = ConstraintId('boxTuat');

  // ConstraintId boxDan = ConstraintId('boxDan');
  // ConstraintId boxSuu = ConstraintId('boxSuu');
  // ConstraintId boxTys = ConstraintId('boxTys');
  // ConstraintId boxHoi = ConstraintId('boxHoi');

  ConstraintId boxTuan = ConstraintId('boxTuan');
  ConstraintId boxTriet = ConstraintId('boxTriet');
  ConstraintId boxTuanTriet = ConstraintId('boxTuanTriet');

  ConstraintId boxDiaBan = ConstraintId('boxDiaBan');

  final AutoSizeGroup minorStarSizeGroup = AutoSizeGroup();
  final AutoSizeGroup majorStarSizeGroup = AutoSizeGroup();
  final AutoSizeGroup positionSizeGroup = AutoSizeGroup();

  // late HouseController tysController;
  // late HouseController suuController;
  // late HouseController danController;
  // late HouseController maoController;
  // late HouseController thinController;
  // late HouseController tyjController;
  // late HouseController ngoController;
  // late HouseController muiController;
  // late HouseController thanController;
  // late HouseController dauController;
  // late HouseController tuatController;
  // late HouseController hoiController;

  final Map<HousePosition, Map<String, dynamic>> data = {};
  final Map<HousePosition, dynamic> constraintData = {};

  @override
  void initState() {
    super.initState();
    for (var position in HousePosition.all()) {
      final controller = HouseController(
        widget.chart.houses[position]!,
      );
      data[position] = {
        'id': ConstraintId(position.chi.name),
        'controller': controller,
      };
      widget.controller.insert(controller);
    }

    widget.controller.listen();

    // data[HousePosition.tys()] = {
    //   'id': boxTys,
    //   'controller': HouseController(
    //     widget.chart.houses[HousePosition.tys()]!,
    //   )
    // };

    // for (var item in data.entries) {
    //   widget.controller.insert(item.value['controller'] as HouseController);
    // }

    // tysController = HouseController(
    //   widget.chart.houses[HousePosition.tys()]!,
    // );
    // tyjController = HouseController(
    //   widget.chart.houses[HousePosition.tyj()]!,
    // );
    // suuController = HouseController(
    //   widget.chart.houses[HousePosition.suu()]!,
    // );
    // dauController = HouseController(
    //   widget.chart.houses[HousePosition.dau()]!,
    // );
    // hoiController = HouseController(
    //   widget.chart.houses[HousePosition.hoi()]!,
    // );

    // widget.controller.insert(tyjController);
    // widget.controller.insert(suuController);
    // widget.controller.insert(dauController);
    // widget.controller.insert(hoiController);
    // widget.controller.listen();
  }

  ConstraintId getConstraintId(HousePosition position) {
    return data[position]!['id'] as ConstraintId;
  }

  ConstraintAlign leftOfTuanTriet(TuanTrietPosition position) {
    return getConstraintId(position.first).left;
  }

  ConstraintAlign rightOfTuanTriet(TuanTrietPosition position) {
    return getConstraintId(position.second).right;
  }

  ConstraintAlign verticalOfTuanTriet(TuanTrietPosition position) {
    final firstPosInt = position.first.toInt();
    if (firstPosInt < 5) {
      return getConstraintId(position.first).top;
    } else {
      return getConstraintId(position.first).bottom;
    }
  }

  bool tuanTrietVisible(TuViChart chart) {
    return chart.posOfTuan.first.toInt() == chart.posOfTriet.first.toInt();
  }

  @override
  Widget build(BuildContext context) {
    // final data = {
    //   HousePosition.tys(): {
    //     'id': boxTys,
    //     'controller': tysController,
    //   },
    //   HousePosition.suu(): boxSuu,
    //   HousePosition.dan(): boxDan,
    //   HousePosition.mao(): boxMao,
    //   HousePosition.thin(): boxThin,
    //   HousePosition.tyj(): boxTyj,
    //   HousePosition.ngo(): boxNgo,
    //   HousePosition.mui(): boxMui,
    //   HousePosition.than(): boxThan,
    //   HousePosition.dau(): boxDau,
    //   HousePosition.tuat(): boxTuat,
    //   HousePosition.hoi(): boxHoi
    // };
    // final houseHeight = //(MediaQuery.of(context).size.height -
    //     AppBar().preferredSize.height -
    //     MediaQuery.of(context).padding.top -
    //     MediaQuery.of(context).padding.bottom) /
    // 4;

    return LayoutBuilder(builder: (context, constraints) {
      var houseHeight = constraints.maxHeight / 4;
      var houseWidth = constraints.maxWidth / 4;

      // if (constraints.maxHeight < constraints.maxWidth) {
      //   houseHeight = 180.0;
      // }
      return ConstraintLayout(childConstraints: [
        Constraint(
          id: getConstraintId(HousePosition.tyj()),
          width: houseWidth,
          height: houseHeight,
          topLeftTo: parent,
        ),
        Constraint(
          id: getConstraintId(HousePosition.ngo()),
          width: houseWidth,
          height: houseHeight,
          left: getConstraintId(HousePosition.tyj()).right,
          top: getConstraintId(HousePosition.tyj()).top,
        ),
        Constraint(
          id: getConstraintId(HousePosition.mui()),
          width: houseWidth,
          height: houseHeight,
          left: getConstraintId(HousePosition.ngo()).right,
          top: getConstraintId(HousePosition.tyj()).top,
        ),
        Constraint(
          id: getConstraintId(HousePosition.than()),
          width: houseWidth,
          height: houseHeight,
          left: getConstraintId(HousePosition.mui()).right,
          top: getConstraintId(HousePosition.tyj()).top,
        ),
        Constraint(
          id: getConstraintId(HousePosition.thin()),
          width: houseWidth,
          height: houseHeight,
          left: getConstraintId(HousePosition.tyj()).left,
          top: getConstraintId(HousePosition.tyj()).bottom,
        ),
        Constraint(
          id: getConstraintId(HousePosition.dau()),
          width: houseWidth,
          height: houseHeight,
          left: getConstraintId(HousePosition.than()).left,
          top: getConstraintId(HousePosition.tyj()).bottom,
        ),
        Constraint(
          id: getConstraintId(HousePosition.mao()),
          width: houseWidth,
          height: houseHeight,
          left: getConstraintId(HousePosition.tyj()).left,
          top: getConstraintId(HousePosition.thin()).bottom,
        ),
        Constraint(
          id: getConstraintId(HousePosition.tuat()),
          width: houseWidth,
          height: houseHeight,
          left: getConstraintId(HousePosition.dau()).left,
          top: getConstraintId(HousePosition.dau()).bottom,
        ),
        Constraint(
          id: getConstraintId(HousePosition.dan()),
          width: houseWidth,
          height: houseHeight,
          left: getConstraintId(HousePosition.tyj()).left,
          top: getConstraintId(HousePosition.mao()).bottom,
        ),
        Constraint(
          id: getConstraintId(HousePosition.suu()),
          width: houseWidth,
          height: houseHeight,
          left: getConstraintId(HousePosition.dan()).right,
          top: getConstraintId(HousePosition.dan()).top,
        ),
        Constraint(
          id: getConstraintId(HousePosition.tys()),
          width: houseWidth,
          height: houseHeight,
          left: getConstraintId(HousePosition.suu()).right,
          top: getConstraintId(HousePosition.dan()).top,
        ),
        Constraint(
          id: getConstraintId(HousePosition.hoi()),
          width: houseWidth,
          height: houseHeight,
          left: getConstraintId(HousePosition.tuat()).left,
          top: getConstraintId(HousePosition.dan()).top,
        ),
        Constraint(
          id: boxDiaBan,
          width: matchConstraint,
          height: matchConstraint,
          left: getConstraintId(HousePosition.thin()).right,
          right: getConstraintId(HousePosition.tuat()).left,
          top: getConstraintId(HousePosition.thin()).top,
          bottom: getConstraintId(HousePosition.mao()).bottom,
        ),
        Constraint(
          id: boxTuan,
          width: 60,
          height: 12,
          left: leftOfTuanTriet(widget.chart.posOfTuan),
          right: rightOfTuanTriet(widget.chart.posOfTuan),
          top: verticalOfTuanTriet(widget.chart.posOfTuan),
          bottom: verticalOfTuanTriet(widget.chart.posOfTuan),
        ),
        Constraint(
          id: boxTriet,
          width: 60,
          height: 12,
          left: leftOfTuanTriet(widget.chart.posOfTriet),
          right: rightOfTuanTriet(widget.chart.posOfTriet),
          top: verticalOfTuanTriet(widget.chart.posOfTriet),
          bottom: verticalOfTuanTriet(widget.chart.posOfTriet),
        ),
        Constraint(
          id: boxTuanTriet,
          width: 60,
          height: 12,
          left: leftOfTuanTriet(widget.chart.posOfTriet),
          right: rightOfTuanTriet(widget.chart.posOfTriet),
          top: verticalOfTuanTriet(widget.chart.posOfTriet),
          bottom: verticalOfTuanTriet(widget.chart.posOfTriet),
        ),
      ], children: [
        for (var entry in data.entries)
          TuviHouseContainer(
            widget.chart.houses[entry.key]!,
            minorStarSizeGroup: minorStarSizeGroup,
            majorStarSizeGroup: majorStarSizeGroup,
            positionSizeGroup: positionSizeGroup,
            translate: widget.translate,
            controller: entry.value['controller'] as HouseController,
            colorScheme: widget.colorScheme,
          ).applyConstraintId(id: entry.value['id'] as ConstraintId),
        DiaBanSection(
          chart: widget.chart,
          humanBio: widget.humanBio,
          colorScheme: widget.colorScheme,
          translate: widget.translate,
        ).applyConstraintId(id: boxDiaBan),
        Visibility(
          visible: !tuanTrietVisible(widget.chart),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                color: Colors.white),
            child: Text(
              widget.translate('tuan'),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  height: 1.1,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ).applyConstraintId(id: boxTuan),
        Visibility(
          visible: !tuanTrietVisible(widget.chart),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                color: Colors.black),
            child: Text(
              widget.translate('triet'),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  height: 1.1,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ).applyConstraintId(id: boxTriet),
        Visibility(
          visible: tuanTrietVisible(widget.chart),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                color: Colors.black),
            child: Text(
              widget.translate('tuanTriet'),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  height: 1.1,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ).applyConstraintId(id: boxTuanTriet)
        // Container(
        //   alignment: Alignment.center,
        //   decoration: BoxDecoration(
        //     color: widget.colorScheme.background,
        //     border:
        //         Border.all(color: widget.colorScheme.onBackground, width: 0.5),
        //   ),
        // ).applyConstraintId(id: boxDiaBan),
      ]
          // contraints
          //     .map((key, value) => MapEntry(
          //           key,
          //           Container(
          //             alignment: Alignment.center,
          //             decoration: BoxDecoration(
          //               border: Border.all(
          //                 color: Colors.black,
          //               ),
          //             ),
          //             child: TuviHouse(widget.chart.houses[key]!),
          //           ).applyConstraintId(id: value),
          //         ))
          //     .values
          //     .toList()
          //     [
          //   TuviHouseContainer(
          //     widget.chart.houses[HousePosition.tyj()]!,
          //     minorStarSizeGroup: minorStarSizeGroup,
          //     majorStarSizeGroup: majorStarSizeGroup,
          //     positionSizeGroup: positionSizeGroup,
          //     translate: widget.translate,
          //     controller: tyjController,
          //     colorScheme: widget.colorScheme,
          //   ).applyConstraintId(id: boxTyj),
          //   // Container(
          //   //   alignment: Alignment.center,
          //   //   decoration: BoxDecoration(
          //   //     border: Border.all(
          //   //       color: Colors.black,
          //   //     ),
          //   //   ),
          //   //   child: TuviHouseContainer(
          //   //     widget.chart.houses[HousePosition.tyj()]!,
          //   //     minorStarSizeGroup: minorStarSizeGroup,
          //   //     majorStarSizeGroup: majorStarSizeGroup,
          //   //     translate: widget.translate,
          //   //     constraintId: boxTyj,
          //   //     controller: tyjController,
          //   //     colorScheme: widget.colorScheme,
          //   //   ),
          //   // ).applyConstraintId(id: boxTyj),
          //   Container(
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //       border: Border.all(
          //         color: Colors.black,
          //       ),
          //     ),
          //   ).applyConstraintId(id: boxNgo),
          //   Container(
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //       border: Border.all(
          //         color: Colors.black,
          //       ),
          //     ),
          //   ).applyConstraintId(id: boxMui),
          //   Container(
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //       border: Border.all(
          //         color: Colors.black,
          //       ),
          //     ),
          //   ).applyConstraintId(id: boxThan),
          //   Container(
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //       border: Border.all(
          //         color: Colors.black,
          //       ),
          //     ),
          //   ).applyConstraintId(id: boxThin),
          //   TuviHouseContainer(
          //     widget.chart.houses[HousePosition.dau()]!,
          //     minorStarSizeGroup: minorStarSizeGroup,
          //     majorStarSizeGroup: majorStarSizeGroup,
          //     translate: widget.translate,
          //     controller: dauController,
          //     colorScheme: widget.colorScheme,
          //   ).applyConstraintId(id: boxDau),
          //   // Container(
          //   //   alignment: Alignment.center,
          //   //   decoration: BoxDecoration(
          //   //     border: Border.all(
          //   //       color: Colors.black,
          //   //     ),
          //   //   ),
          //   // ).applyConstraintId(id: boxDau),
          //   Container(
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //       border: Border.all(
          //         color: Colors.black,
          //       ),
          //     ),
          //   ).applyConstraintId(id: boxMao),
          //   Container(
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //       border: Border.all(
          //         color: Colors.black,
          //       ),
          //     ),
          //   ).applyConstraintId(id: boxTuat),
          //   Container(
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //       border: Border.all(
          //         color: Colors.black,
          //       ),
          //     ),
          //   ).applyConstraintId(id: boxDan),
          //   TuviHouseContainer(
          //     widget.chart.houses[HousePosition.suu()]!,
          //     minorStarSizeGroup: minorStarSizeGroup,
          //     majorStarSizeGroup: majorStarSizeGroup,
          //     translate: widget.translate,
          //     controller: suuController,
          //     colorScheme: widget.colorScheme,
          //   ).applyConstraintId(id: boxSuu),
          //   // Container(
          //   //   alignment: Alignment.center,
          //   //   decoration: BoxDecoration(
          //   //     border: Border.all(
          //   //       color: Colors.black,
          //   //     ),
          //   //   ),
          //   // ).applyConstraintId(id: boxSuu),
          //   Container(
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //       border: Border.all(
          //         color: Colors.black,
          //       ),
          //     ),
          //   ).applyConstraintId(id: boxTys),
          //   TuviHouseContainer(
          //     widget.chart.houses[HousePosition.hoi()]!,
          //     minorStarSizeGroup: minorStarSizeGroup,
          //     majorStarSizeGroup: majorStarSizeGroup,
          //     translate: widget.translate,
          //     controller: hoiController,
          //     colorScheme: widget.colorScheme,
          //   ).applyConstraintId(id: boxHoi),
          //   // Container(
          //   //   alignment: Alignment.center,
          //   //   decoration: BoxDecoration(
          //   //     border: Border.all(
          //   //       color: Colors.black,
          //   //     ),
          //   //   ),
          //   // ).applyConstraintId(id: boxHoi),
          // Container(
          //   alignment: Alignment.center,
          //   decoration: BoxDecoration(
          //     color: widget.colorScheme.background,
          //     border: Border.all(
          //       color: Colors.black,
          //     ),
          //   ),
          // ).applyConstraintId(id: boxDiaBan),
          //   Container(
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //         border: Border.all(
          //           color: Colors.black,
          //         ),
          //         color: Colors.white),
          //     child: const Text(
          //       'Tuần',
          //       style: TextStyle(color: Colors.black, fontSize: 10),
          //     ),
          //   ).applyConstraintId(id: boxTuan),
          //   Container(
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //         border: Border.all(
          //           color: Colors.black,
          //         ),
          //         color: Colors.black),
          //     child: const Text(
          //       'Triệt',
          //       style: TextStyle(color: Colors.white, fontSize: 10),
          //     ),
          //   ).applyConstraintId(id: boxTriet),
          //   Container(
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //         border: Border.all(
          //           color: Colors.black,
          //         ),
          //         color: Colors.black),
          //     child: const Text(
          //       'Tuần-Triệt',
          //       style: TextStyle(color: Colors.white, fontSize: 10),
          //     ),
          //   ).applyConstraintId(id: boxTuanTriet),
          // ],
          );
    });
  }
}
