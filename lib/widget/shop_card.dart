import 'package:dice/provider/point_provider.dart';
import 'package:dice/utils/theme.dart';
import 'package:dice/widget/dice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopCard extends StatelessWidget {
  final int index;
  const ShopCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PointProvider _point = context.read();
    return Card(
      child: Column(
        key: UniqueKey(),
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: DiceColor(
                  bgColor: DiceTheme.shop[index].bgColor,
                  dcColor: DiceTheme.shop[index].dcColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Text(
              "Color: ${DiceTheme.shop[index].bgColor.toString().split('(').last.split(')').first}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              "Price: ${2 * (index + 1)}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///Button
              Consumer<PointProvider>(
                builder: (_, provider, __) {
                  return ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        DiceTheme.shop[index].compare(provider.selected)
                            ? Colors.grey
                            : Colors.blue,
                      ),
                    ),
                    onPressed: () {
                      // DiceModel.formList([12,23,45,5]);
  // print("test is ${DiceModel.formList([56,34,67,78],)}");
                      // print("own is => ${provider.}");
                      print("MyProvider ${provider.myTheme.isNotEmpty}");

                      if (provider.myTheme.isNotEmpty) {
                        print(
                            "Selected Theme is ${DiceTheme.shop[index].compare(provider.myTheme)}");
                        print(
                            "first test =>${DiceModel(Colors.green, Colors.white)}");
                        print("model ${DiceModel.formList([
                              76,
                              175,
                              80,
                              1.0
                            ]).bgColor}");
                        print(
                            "fuck Theme => ${DiceModel(Colors.green, Colors.white).compare(provider.myTheme)}");

                        print("dice shop index=>${DiceTheme.shop[index]}");
                        print("my theme is =>${provider.myTheme}");
                        if (DiceTheme.shop[index].compare(provider.myTheme)) {
                          ///ToDo
                          _point.selectedTheme(index);
                        } else {
                          _point.buy(index);
                        }
                      } else {
                        _point.buy(index);
                      }
                      // setState(() {});
                    },
                    icon: Icon(
                      DiceTheme.shop[index].compare(provider.myTheme)
                          ? DiceTheme.shop[index].compare(provider.selected)
                              ? CupertinoIcons.check_mark_circled_solid
                              : CupertinoIcons.checkmark_circle
                          : CupertinoIcons.tag,
                    ),
                    label: Text(
                      DiceTheme.shop[index].compare(provider.myTheme)
                          ? "Set Theme"
                          : "Buy",
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
