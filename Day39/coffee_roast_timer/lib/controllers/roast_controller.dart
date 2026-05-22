import 'dart:async';
import 'package:flutter/material.dart';
import '../models/roast_model.dart';

class RoastController extends ChangeNotifier {

  Timer? timer;

  RoastModel roast = RoastModel(
    seconds: 0,
    stage: "Green",
    color: Colors.green,
  );

  void startRoasting() {

    timer?.cancel();

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {

        if (roast.seconds >= 50) {
          timer.cancel();
          return;
        }

        roast.seconds++;

        _updateStage();

        notifyListeners();
      },
    );
  }

  void _updateStage() {

    if (roast.seconds < 20) {

      roast.stage = "Green";
      roast.color = Colors.green;

    } else if (roast.seconds < 30) {

      roast.stage = "Light Brown";
      roast.color = Colors.orange;

    } else if (roast.seconds < 40) {

      roast.stage = "Brown";
      roast.color = Colors.brown;

    } else {

      roast.stage = "Dark Brown";
      roast.color = Colors.black87;
    }
  }

  void forward() {

    if (roast.seconds < 50) {

      roast.seconds += 10;

      if (roast.seconds > 50) {
        roast.seconds = 50;
      }

      _updateStage();

      notifyListeners();
    }
  }

  void back() {

    if (roast.seconds > 0) {

      roast.seconds -= 10;

      if (roast.seconds < 0) {
        roast.seconds = 0;
      }

      _updateStage();

      notifyListeners();
    }
  }

  void reset() {

    timer?.cancel();

    roast.seconds = 0;
    roast.stage = "Green";
    roast.color = Colors.green;

    notifyListeners();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}