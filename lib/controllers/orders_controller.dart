import 'package:eden_app_test/controllers/ably_controller.dart';
import 'package:eden_app_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:provider/provider.dart';

class OrdersController extends ControllerMVC {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final clientOptions = ably.ClientOptions(key: 'ARq01A.1VYTtw:luCFDqbQU2IJDfa0Fy4wPPo-gRaBriUSolY9_16f0VI');
  ably.Realtime realtime = ably.Realtime(options: ably.ClientOptions(key: 'ARq01A.1VYTtw:luCFDqbQU2IJDfa0Fy4wPPo-gRaBriUSolY9_16f0VI'));

  bool processing = true;
  OverlayEntry? loader;

  void mockStatusUpdates(BuildContext context) async {
    final channel = realtime.channels.get('testing salary');

    try {
      await Future.delayed(const Duration(seconds: 10));
      await channel.publish(message: ably.Message(name: 'eden'), name: kOrderPlaced);
      await Future.delayed(const Duration(seconds: 10));
      await channel.publish(message: ably.Message(name: 'eden'), name: kOrderAccepted).then(
            (value) => context.read<AblyTracker>().syncUpdate(0.2, 'Order accepted')
          );
      await Future.delayed(const Duration(seconds: 10));
      await channel.publish(message: ably.Message(name: 'eden'), name: kOrderPickUP).then(
              (value) => context.read<AblyTracker>().syncUpdate(0.2, 'Order pickup is in progress')
      );
      await Future.delayed(const Duration(seconds: 10));
      await channel.publish(message: ably.Message(name: 'eden'), name: kOrderOnTransit).then(
              (value) => context.read<AblyTracker>().syncUpdate(0.2, 'Your order is on the way')
      );
      await Future.delayed(const Duration(seconds: 10));
      await channel.publish(message: ably.Message(name: 'eden'), name: kOrderArrived).then(
              (value) => context.read<AblyTracker>().syncUpdate(0.2, 'Your order has arrived')
      );;
      await Future.delayed(const Duration(seconds: 10));
      await channel.publish(message: ably.Message(name: 'eden'), name: kOrderDelivered).then(
              (value) => context.read<AblyTracker>().syncUpdate(0.2, 'Order delivered')
      );;
    } catch (e) {
      print('Error publishing status update: $e');
    }
  }

  OrdersController();
}
