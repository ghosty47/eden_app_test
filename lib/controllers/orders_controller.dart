import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class OrdersController extends ControllerMVC {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool processing = true;
  OverlayEntry? loader;
  double percent = 0.2;
  String orderText = 'Your order has been placed';

  OrdersController();
}
