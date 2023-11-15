import 'package:eden_app_test/controllers/orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  OrdersViewState createState() => OrdersViewState();
}

class OrdersViewState extends StateMVC<OrdersView> {
  OrdersViewState() : super(OrdersController()) {
    con = controller as OrdersController;
  }

  late OrdersController con;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
        key: con.scaffoldKey,
        body: Column(),
      ),
    );
  }
}
