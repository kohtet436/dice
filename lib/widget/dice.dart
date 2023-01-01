import 'package:dice/provider/dice_provider.dart';
import 'package:dice/provider/point_provider.dart';
import 'package:dice/widget/circle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiceColor extends StatelessWidget {
  final Color bgColor;
  final Color dcColor;
  const DiceColor({Key? key, required this.bgColor, required this.dcColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.35),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(-1, 1),
              )
            ],
            color: bgColor,
          ),
        ),
        SizedBox(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ///6
              Row(
                children: [
                  for (var i = 0; i < 3; i++)
                    DiceCircle(
                      color: dcColor,
                    )
                ],
              ),
              Row(
                children: [
                  for (var i = 0; i < 3; i++)
                    DiceCircle(
                      color: dcColor,
                    )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class DiceText extends StatelessWidget {
  final int count;
  const DiceText({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DiceProvider provider = context.read();

    return GestureDetector(
      onTap: () {
        provider.predict = count;
      },
      child: Consumer<DiceProvider>(builder: (_, dice, __) {
        return Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.35),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(-1, 1),
              )
            ],
            color: dice.predict == count ? Colors.green : Colors.white,
          ),
          alignment: Alignment.center,
          child: Text(
            count.toString(),
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        );
      }),
    );
  }
}

class Dice extends StatelessWidget {
  final int count;
  const Dice({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Consumer<PointProvider>(
          builder: (_, point, child) => Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.35),
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: Offset(-1, 1),
                )
              ],
              color: point.selected.isEmpty
                  ? const Color.fromRGBO(255, 255, 255, 0.5)
                  : Color.fromRGBO(
                      int.parse(point.selected[0].toString()),
                      int.parse(point.selected[1].toString()),
                      int.parse(point.selected[2].toString()),
                      double.parse(point.selected[3].toString()),
                    ),
            ),
          ),
        ),
        SizedBox(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (count <= 3) ...[
                ///1-3
                Row(
                  children: [
                    for (int i = 0; i < count; i++) const DiceCircle(),
                  ],
                )
              ] else if (count == 5) ...[
                SizedBox(
                  width: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      DiceCircle(),
                      DiceCircle(),
                    ],
                  ),
                ),
                Row(
                  children: const [
                    DiceCircle(),
                  ],
                ),
                SizedBox(
                  width: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      DiceCircle(),
                      DiceCircle(),
                    ],
                  ),
                ),
              ] else if (count == 4) ...[
                ///4

                SizedBox(
                  width: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [for (var i = 0; i < 2; i++) const DiceCircle()],
                  ),
                ),
                SizedBox(
                  width: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [for (var i = 0; i < 2; i++) const DiceCircle()],
                  ),
                ),
              ] else ...[
                ///6
                Row(
                  children: [for (var i = 0; i < 3; i++) const DiceCircle()],
                ),
                Row(
                  children: [for (var i = 0; i < 3; i++) const DiceCircle()],
                ),
              ]
            ],
          ),
        )
      ],
    );
  }
}
