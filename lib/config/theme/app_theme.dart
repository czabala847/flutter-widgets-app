import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectorColor;

  AppTheme({this.selectorColor = 0})
    : assert(selectorColor >= 0, 'Selected color must be greater than 0'),
      assert(
        selectorColor < colorList.length,
        'Selected color must be less or equal than ${colorList.length - 1}',
      );

  ThemeData getTheme() => ThemeData(
    colorSchemeSeed: colorList[selectorColor],
    appBarTheme: const AppBarTheme(centerTitle: false),
  );
}
