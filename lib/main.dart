import 'package:dice/provider/dice_provider.dart';
import 'package:dice/provider/point_provider.dart';
import 'package:dice/provider/slider_provider.dart';
import 'package:dice/view/dice_view.dart';
import 'package:dice/view/home_view.dart';
import 'package:dice/view/shop_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight_http_cached/starlight_http_cached.dart';
import 'package:starlight_utils/starlight_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
// Color green=Colors.green;
// print("rgbo is ${[green.red,green.green,green.blue,green.opacity]}");
// print("Colors is ${Color.fromRGBO(76, 175, 80, 1.0)}");
// print("Equal ${green.compare(Color.fromRGBO(76, 175, 80, 1.0))}");
  await StarlightHttpCached.instance;
  // print("void main");
  // StarlightHttpCached.setCached(data: 100, name: 'point');


  // StarlightHttpCached.deleteCached(name: 'point');
  // StarlightHttpCached.deleteCached(name: 'selected');
  // StarlightHttpCached.deleteCached(name: 'myTheme');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("MyApp is Build");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SliderProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DiceProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PointProvider(),
        ),
      ],
      child: MaterialApp(
        // showPerformanceOverlay: true,
        debugShowCheckedModeBanner: false,
        navigatorKey: StarlightUtils.navigatorKey,
        onGenerateInitialRoutes: (_) => [
          MaterialPageRoute(
            builder: (_) => const DiceHome(),
          ),
        ],
        onGenerateRoute: (_) {
          switch (_.name) {
            case 'play':
              return route(
                const DiceView(),
              );
            case 'home':
              return route(
                const DiceHome(),
              );
            case 'shop':
              return route(
                const ShopView(),
              );
            default:
              return route(
                const DiceHome(),
              );
          }
        },
      ),
    );
  }
}

MaterialPageRoute route(Widget child) => MaterialPageRoute(
      builder: (_) => child,
    );
