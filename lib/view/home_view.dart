import 'package:dice/provider/dice_provider.dart';
import 'package:dice/provider/slider_provider.dart';
import 'package:dice/utils/theme.dart';
import 'package:dice/widget/home_button.dart';
import 'package:dice/widget/point.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight_utils/starlight_utils.dart';

class DiceHome extends StatelessWidget {
  const DiceHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: DiceTheme.gradient1,
        width: context.width,
        child: Stack(
          children: [
            SizedBox(
              width: context.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HomeButton(
                    title: "Play",
                    icon: Icons.play_arrow,
                    onPressed: () {
                      context.read<SliderProvider>().predict = 0;
                      context.read<DiceProvider>().reset();
                      // context.read<DiceProvider>().reset();
                      StarlightUtils.pushNamed('play');
                    },
                  ),
                  HomeButton(
                    title: "Shop",
                    icon: Icons.shopify_outlined,
                    onPressed: () {
                      StarlightUtils.pushNamed('shop');
                    },
                  )
                ],
              ),
            ),
            const Positioned(
              top: 0,
              right: 20,
              child: SafeArea(
                child: UserPoint(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
