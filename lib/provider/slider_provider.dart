import 'package:flutter/material.dart';

class SliderProvider extends ChangeNotifier {
  double _predict = 0;

  double get predict => _predict;

  set predict(double data) {
    _predict = data;
    notifyListeners();
  }

  void onChange(double _) {
    _predict = _;

    notifyListeners();
  }
}
