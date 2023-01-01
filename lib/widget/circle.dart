import 'package:dice/provider/point_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiceCircle extends StatelessWidget {
  final Color? color;
  const DiceCircle({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PointProvider provider = context.read();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: CircleAvatar(
        radius: 7,
        backgroundColor: color == null
            ? provider.selected.isEmpty
                ? Colors.red
                : Colors.white
            : color!,
      ),
    );
  }
}
