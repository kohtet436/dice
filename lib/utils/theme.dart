import 'package:dice/widget/dice.dart';
import 'package:flutter/material.dart';

class DiceModel {
  final Color bgColor;
  final Color dcColor;
  DiceModel(this.bgColor, this.dcColor);

  factory DiceModel.formList(List data) {
    print("List is $data");
    return DiceModel(
        Color.fromRGBO(data[0], data[1], data[2], data[3]),
        Colors.white,
      );}

  ///List<dynamic>
  ///own List=> item => List<int>
  ///select List<int> => int
  bool compare(List own) {
    try {
      if (own[0] is List) {
        ///BuyTheme
        for (var item in own) {
          if (item[0] == bgColor.red &&
              item[1] == bgColor.green &&
              item[2] == bgColor.blue &&
              item[3] == bgColor.opacity) {
            return true;
          }
        }
      } else {
        ///Selected
        if (own[0] == bgColor.red &&
            own[1] == bgColor.green &&
            own[2] == bgColor.blue &&
            own[3] == bgColor.opacity) {
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}

class DiceTheme {
  static List<DiceModel> shop = [
    DiceModel(Colors.green, Colors.white),
    DiceModel(Colors.red, Colors.white),
    DiceModel(Colors.blue, Colors.white),
    DiceModel(Colors.pink, Colors.white),
    DiceModel(Colors.amber, Colors.white),
    DiceModel(Colors.indigo, Colors.white),
    DiceModel(Colors.yellow, Colors.white),
    DiceModel(Colors.teal, Colors.white),
    DiceModel(Colors.purple, Colors.white),
    DiceModel(Colors.orange, Colors.white),
  ];

  static BoxDecoration gradient1 = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.red,
        Colors.white,
        Colors.blue,
      ],
    ),
  );

  static BoxDecoration gradient2 = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.blue,
        Colors.white,
        Colors.red,
      ],
    ),
  );

  static ButtonStyle buttonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.red.shade500),
    elevation: MaterialStateProperty.all(2),
  );

  static OutlineInputBorder border({Color? color, double? width}) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          width: width ?? 1.0,
          color: color ?? Colors.red.shade500,
        ),
      );
}
