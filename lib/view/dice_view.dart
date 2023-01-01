import 'package:dice/provider/dice_provider.dart';
import 'package:dice/provider/slider_provider.dart';
import 'package:dice/utils/theme.dart';
import 'package:dice/widget/dice.dart';
import 'package:dice/widget/dice_slider.dart';
import 'package:dice/widget/predict_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight_utils/starlight_utils.dart';

class DiceView extends StatelessWidget {
  const DiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StarlightUtils.of(context);
    final DiceProvider dice = context.read<DiceProvider>();
    print("Dice View is build");
    return Scaffold(
      body: Container(
        decoration: DiceTheme.gradient1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ///Two Dice
            Consumer<DiceProvider>(
              builder: (_, provider, __) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Dice(
                    count: provider.dice1,
                  ),
                  Dice(
                    count: provider.dice2,
                  ),
                ],
              ),
            ),

            const PredictText(),

            const PredictDiceView(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: DiceTheme.buttonStyle,
                  onPressed: () async {
                    if (dice.predict == 0) {
                      StarlightUtils.dialog(const AlertDialog(
                        title: Text("Failed"),
                        content: Text("Please a choose a value"),
                        actions: [
                          TextButton(
                            onPressed: StarlightUtils.pop,
                            child: Text("ok"),
                          )
                        ],
                      ));
                      return;
                    }
                    await dice.go(context);
                  },
                  child: const Text("Go"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChildView extends StatelessWidget {
  const ChildView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("ChildView is Build");
    return Container();
  }
}
