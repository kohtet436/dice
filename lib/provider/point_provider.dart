import 'package:dice/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:starlight_http_cached/starlight_http_cached.dart';
import 'package:starlight_utils/starlight_utils.dart';

class PointProvider extends ChangeNotifier {
  int _point = 0;

  final List myTheme = [];

  List selected = [];

  PointProvider() {
    print("point provider is Started");
    tryIt(
      () => _point = StarlightHttpCached.getCached(name: 'point'),
    );
    tryIt(
      () => myTheme.addAll(
        StarlightHttpCached.getCached(
          name: 'myTheme',
        ),
      ),
    );
    tryIt(
      () => selected = StarlightHttpCached.getCached(name: 'selected'),
    );
  }

  void tryIt(Function fun) {
    try {
      fun();
    } catch (e) {
      print("error is $e");
    }
  }

  int _chance = 5;

  int get chance => _chance;

  set chance(int value) {
    if (value != _chance) {
      _chance = value;
      // notifyListeners();
    }
  }

  int get point => _point;

  set point(int value) {
    _point = value;
    StarlightHttpCached.setCached(name: 'point', data: _point);
    // notifyListeners();
  }

  ///Select
  ///List<int>
  void selectedTheme(int index) {
    StarlightHttpCached.setCached(
      name: 'selected',
      data: [
        DiceTheme.shop[index].bgColor.red,
        DiceTheme.shop[index].bgColor.green,
        DiceTheme.shop[index].bgColor.blue,
        DiceTheme.shop[index].bgColor.opacity,
      ],
    );

    selected = [
      DiceTheme.shop[index].bgColor.red,
      DiceTheme.shop[index].bgColor.green,
      DiceTheme.shop[index].bgColor.blue,
      DiceTheme.shop[index].bgColor.opacity,
    ];

    print("Selected => ${DiceTheme.shop[index].compare(selected)}");
print("selected is $selected");
    notifyListeners();
  }

  ///own color
  ///List<List<int>>
  void buy(int index) {
    if (2 * (index + 1) <= point) {
      myTheme.add([
        DiceTheme.shop[index].bgColor.red,
        DiceTheme.shop[index].bgColor.green,
        DiceTheme.shop[index].bgColor.blue,
        DiceTheme.shop[index].bgColor.opacity,
      ]);
      StarlightHttpCached.setCached(
        name: 'myTheme',
        data: myTheme,
      );
      point -= (2 * (index + 1));
      StarlightHttpCached.setCached(
        name: 'point',
        data: point,
      );
      notifyListeners();
    } else {
      StarlightUtils.dialog(AlertDialog(
        title: Text("Failed"),
        content: Text("not enough"),
        actions: [
          TextButton(
            onPressed: StarlightUtils.pop,
            child: Text("Ok"),
          )
        ],
      ));
    }
    notifyListeners();
  }
}
