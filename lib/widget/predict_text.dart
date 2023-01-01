import 'package:dice/provider/dice_provider.dart';
import 'package:dice/provider/slider_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PredictText extends StatelessWidget {
  const PredictText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DiceProvider provider = context.watch<DiceProvider>();
    return Text(
      "${provider.predict}",
      style: const TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
    );
  }
}
