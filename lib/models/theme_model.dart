import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  bool _isHighContrast = false;
  double _fontSize = 16.0;

  bool get isHighContrast => _isHighContrast;
  double get fontSize => _fontSize;

  void toggleHighContrast() {
    _isHighContrast = !_isHighContrast;
    notifyListeners();
  }

  void setFontSize(double size) {
    _fontSize = size;
    notifyListeners();
  }
}
