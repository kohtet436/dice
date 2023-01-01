import 'package:dice/provider/dice_provider.dart';
import 'package:dice/provider/slider_provider.dart';
import 'package:dice/widget/dice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PredictDiceView extends StatelessWidget {
  const PredictDiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            DiceText(
              key: ValueKey(1),
              count: 2,
            ),
            DiceText(
              key: ValueKey(2),
              count: 3,
            ),
            DiceText(
              key: ValueKey(3),
              count: 4,
            ),
            DiceText(
              key: ValueKey(4),
              count: 5,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            DiceText(
              key: ValueKey(5),
              count: 6,
            ),
            DiceText(
              key: ValueKey(6),
              count: 7,
            ),
            DiceText(
              key: ValueKey(7),
              count: 8,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            DiceText(
              key: ValueKey(8),
              count: 9,
            ),
            DiceText(
              key: ValueKey(9),
              count: 10,
            ),
            DiceText(
              key: ValueKey(10),
              count: 11,
            ),
            DiceText(
              key: ValueKey(11),
              count: 12,
            ),
          ],
        ),
      ],
    );
  }
}

class DiceSlider extends StatelessWidget {
  const DiceSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SliderProvider>(
      builder: (_, provider, __) => Slider(
        inactiveColor: Colors.white,
        activeColor: Colors.red.shade400,
        divisions: 12,
        value: provider.predict,
        max: 12,
        onChanged: provider.onChange,
      ),
    );
  }
}
