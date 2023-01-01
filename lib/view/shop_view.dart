import 'package:dice/provider/point_provider.dart';
import 'package:dice/utils/theme.dart';
import 'package:dice/widget/dice.dart';
import 'package:dice/widget/point.dart';
import 'package:dice/widget/shop_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight_http_cached/starlight_http_cached.dart';
import 'package:starlight_utils/starlight_utils.dart';

class ShopView extends StatelessWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("ShopView is Build");
    StarlightUtils.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            StarlightUtils.pop();                ///what
          },
          splashRadius: 20,
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Shop"),
        actions:const  [
//           Consumer<PointProvider>(builder: (_,provider,__)=>ElevatedButton(
//             style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Color.fromRGBO(76, 175, 80, 1))),
//             onPressed: (){
//               print("first test =>${DiceModel(Colors.green, Colors.white)}");
// print("fuck Theme => ${DiceModel(Colors.green, Colors.white).compare(provider.myTheme)}");

//             print("mytheme => ${provider.myTheme}");
//             print("Selected => ${provider.selected}");

//           }, child: Text("theme"))),
          UserPoint(
            margin: EdgeInsets.only(top: 5, bottom: 5),
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: DiceTheme.shop.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (_, i) => ShopCard(
          index: i,
        ),
      ),
    );
  }
}
