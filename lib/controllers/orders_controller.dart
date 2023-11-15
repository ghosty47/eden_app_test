import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class OrdersController extends ControllerMVC {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool processing = true;
  OverlayEntry? loader;

  OrdersController();
}
