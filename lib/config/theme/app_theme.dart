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
  final bool isDarkMode;

  AppTheme({this.selectorColor = 0, this.isDarkMode = false})
    : assert(selectorColor >= 0, 'Selected color must be greater than 0'),
      assert(
        selectorColor < colorList.length,
        'Selected color must be less or equal than ${colorList.length - 1}',
      );

  ThemeData getTheme() => ThemeData(
    colorSchemeSeed: colorList[selectorColor],
    appBarTheme: const AppBarTheme(centerTitle: false),
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
  );

  AppTheme copyWith({int? selectedColor, bool? isDarkmode}) => AppTheme(
    selectorColor: selectedColor ?? selectorColor,
    isDarkMode: isDarkmode ?? isDarkMode,
  );
}
