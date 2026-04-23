import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5C11D4);

const List<Color> _colorThemes = [
  _customColor,
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColorIndex;

  AppTheme({this.selectedColorIndex = 0})
      : assert(
            selectedColorIndex >= 0 && selectedColorIndex < _colorThemes.length,
            'selectedColorIndex must be between 0 and ${_colorThemes.length - 1}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorThemes[selectedColorIndex]
        
        );
  }
}
