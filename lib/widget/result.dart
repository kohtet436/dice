import 'dart:math';

import 'package:dice/provider/dice_provider.dart';
import 'package:dice/provider/point_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight_utils/starlight_utils.dart';

final List<String> winner = [
  'https://media3.giphy.com/media/WtOkaikiwaR87ZvAFH/giphy.gif',
  'https://rankedbyvotes.com/wp-content/uploads/Community-Education.gif',
  'https://i.pinimg.com/originals/aa/f7/f2/aaf7f2bb862a0004acad5bff2b08d927.gif',
  // 'https://media0.giphy.com/media/2gtoSIzdrSMFO/giphy.gif',
  // 'https://c.tenor.com/cVszsng6O3oAAAAC/winner.gif',
  // 'https://c.tenor.com/E6lFjorkDRAAAAAM/winner.gif',
];

final List<String> looser = [
  'https://cliply.co/wp-content/uploads/2021/03/392103840_SAD_EMOJI_WITH_TEAR_400px.gif',
  'https://i.pinimg.com/originals/e2/8e/73/e28e73c09ec4f3a2f7c1f4aeec45301c.gif',
  // 'https://i.gifer.com/IZE.gif',
  // 'https://i.gifer.com/Q1Qo.gif',
  // 'https://i.gifer.com/2tdL.gif',
];

class DiceResult extends StatelessWidget {
  const DiceResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PointProvider point = context.read();
    return Consumer<DiceProvider>(
      builder: (_, dice, __) {
        return point.chance == 0
            ? AlertDialog(
                title: Center(
                  child: Text("Game Over"),
                ),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  TextButton(
                    onPressed: () {
                      point.chance = 5;
                      StarlightUtils.pushNamedAndRemoveUntil(
                        'home',
                        (p0) => false,
                      );
                    },
                    child: Text("Ok"),
                  )
                ],
              )
            : AlertDialog(
                backgroundColor: Colors.pink.shade300,
                actionsOverflowButtonSpacing: 100,
                elevation: 4,
                titlePadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.zero,
                actionsPadding: EdgeInsets.zero,
                content: dice.result?Text("Win"):Text("Lose"),
                // content: GifView.network(
                //   dice.result
                //       ? winner[Random.secure().nextInt(winner.length)]
                //       : looser[Random.secure().nextInt(looser.length)],
                //   // height: 200,
                //   // width: 200,
                //   fit: BoxFit.contain,
                // ),
              );
      },
    );
  }
}
