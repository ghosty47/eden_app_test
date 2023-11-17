import 'package:flutter/material.dart';

class AblyTracker extends ChangeNotifier {

  double percent = 0.0;
  String orderText = 'Your order has been placed';

  void syncUpdate (double p, String o) {
    percent += p;
    orderText = o;
    notifyListeners();
  }

  AblyTracker();
}
