import 'dart:math';

import 'package:dice/provider/point_provider.dart';
import 'package:dice/widget/result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight_sync/starlight_sync.dart';
import 'package:starlight_utils/starlight_utils.dart';

// final String win =
//     'https://audio-previews.elements.envatousercontent.com/files/346283668/preview.mp3?response-content-disposition=attachment%3B+filename%3D%22YXFBY9J-win.mp3%22';

// final String lose =
//     'https://audio-previews.elements.envatousercontent.com/files/186879055/preview.mp3?response-content-disposition=attachment%3B+filename%3D%229ZBAYW2-losing-04.mp3%22';

// final String gameOver =
//     'https://audio-previews.elements.envatousercontent.com/files/270025565/preview.mp3?response-content-disposition=attachment%3B+filename%3D%22TZRM68V-game-over.mp3%22';

class DiceProvider extends ChangeNotifier {
  final Random random = Random.secure();

  int dice1 = 6;

  int dice2 = 6;

  bool ready = true;

  int _predict = 0;

  int get predict => _predict;
  bool get result => (dice1 + dice2) == _predict;

  set predict(int data) {
    _predict = data;
    notifyListeners();
  }

  void reset() {
    dice1 = 6;
    dice2 = 6;
    _predict = 0;
    ready = true;
  }

  Future<void> go(BuildContext context) async {
    if (!ready) return;
    final PointProvider point = context.read<PointProvider>();

    final String id = "id-${Random.secure().nextInt(100)}";

    StarlightSync.register(id: id);

    ready = false;
    StarlightSync.repeat(
      id: id,
      next: (result)async{Random.secure().nextInt(3);},
      // terminate: true,
      stop: (next)async{
        final bool result = next == 0;
        print("next =>$next");
        if (result) {
          final bool _result = _predict == (dice1 + dice2);
          print("dice1 =>$dice1");
          print("dice2 =>$dice2");
          print("Result=>$_result");

          if (_result) {
            point.point++;
            point.chance = point.chance - 1;
            

            // try {
            //   assetsAudioPlayer.open(
            //     Audio.network(win),
            //     loopMode: LoopMode.none,
            //   );
            // } catch (t) {
            //   //mp3 unreachable
            // }
          } else {
            point.chance = point.chance - 1;
            // try {
            //   assetsAudioPlayer.open(
            //     Audio.network(
            //       point.chance == 0 ? gameOver : lose,
            //     ),
            //     loopMode: LoopMode.none,
            //   );
            // } catch (t) {
            //   //mp3 unreachable
            // }
          }
          notifyListeners();
          
          print("result $_result");
          print("chance ${point.chance}");

          print("point ${point.point}");

          ///.dex
          ///mutlidex failed
          ///dex is disable

          StarlightUtils.dialog(
            const DiceResult(),
          ).then((_) {
            ready = true;
            _predict = 0;
            dice1 = 6;
            dice2 = 6;
            notifyListeners();
            if (point.chance == 0) {
              StarlightUtils.pushNamedAndRemoveUntil(
                'home',
                (p0) => false,
              );
            }
          });
        }
        return result;
        
      },
      task: ([a]) async => {
        dice1=random.nextInt(6)+1,
        dice2=random.nextInt(6)+1,
      notifyListeners()

        // 'dice1': random.nextInt(6) + 1,
        // 'dice2': random.nextInt(6) + 1,
      },
    );

    // StarlightSync.stream(id: id).listen(
    //   (event) {
    //     dice1=event.dice1;
    //     dice2=event.dice2;
        
      
    //   // dice1 = event['dice1'];
    //   // dice2 = event['di>ce2'];
    //   print("1=$dice1");
    //   print("2=>$dice2");


    //   notifyListeners();
    // },
    

    // );
    
  }
}






































// dice1=Random.secure().nextInt(6)+1;
// dice2=Random.secure().nextInt(6)+1;
// bool _result=_predict==(dice1+dice2);

// if(_result){
//   point.point++;

//   }
//   point.chance=point.chance-1;
// notifyListeners();
//   print("chance is ${point.chance}");
//   print("point is ${point.point}");
// await StarlightUtils.dialog(
//             const DiceResult(),
//           ).then((_) {
//             ready = true;
//             _predict = 0;
//             dice1 = 6;
//             dice2 = 6;
//             notifyListeners();
//             if (point.chance == 0) {
//               StarlightUtils.pushNamedAndRemoveUntil(
//                 'home',
//                 (p0) => false,
//               );
//             }
//           });