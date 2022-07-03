import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'day.dart';
import 'expense.dart';
import 'pair.dart';

class ChartBuilder {
  ChartBuilder({required this.myDay}) {
    total = 0;
    for (Pair value in myDay.expenses) {
      total += value.right;
      if (!perExpense.containsKey(value.left.name)) {
        perExpense[value.left.name] = 0;
        colors[value.left.name] = value.left.color;
      }
      perExpense[value.left.name] = perExpense[value.left.name]! + value.right;
    }
  }
  Day myDay;
  late double total;
  Map<String, double> perExpense = {};
  Map<String, Color> colors = {};

  Widget build() {
    return SfCircularChart(
      //legend: Legend(isVisible: true, position: LegendPosition.bottom),
      series: <CircularSeries<String, String>>[
        DoughnutSeries<String, String>(
          dataSource: perExpense.keys.toList(),
          pointColorMapper: (String val, _) => colors[val],
          xValueMapper: (String val, _) => val,
          yValueMapper: (String val, _) => perExpense[val],
          explode: true,
          strokeWidth: 1,
          legendIconType: LegendIconType.rectangle,
          dataLabelMapper: (String val, _) =>
              "${(perExpense[val]! / total * 100).toStringAsFixed(2)}%",
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}
