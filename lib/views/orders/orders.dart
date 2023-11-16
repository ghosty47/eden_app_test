import 'package:eden_app_test/controllers/orders_controller.dart';
import 'package:eden_app_test/utils/app_colors.dart';
import 'package:eden_app_test/utils/app_styles.dart';
import 'package:eden_app_test/utils/orders_data.dart';
import 'package:eden_app_test/widgets/app_bar_widget.dart';
import 'package:eden_app_test/widgets/basic_container_widget.dart';
import 'package:eden_app_test/widgets/cart_widget.dart';
import 'package:eden_app_test/widgets/featured_button_widget.dart';
import 'package:eden_app_test/widgets/order_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:ably_flutter/ably_flutter.dart' as ably;

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

  final clientOptions = ably.ClientOptions(key: 'ARq01A.1VYTtw:luCFDqbQU2IJDfa0Fy4wPPo-gRaBriUSolY9_16f0VI');
  ably.Realtime realtime = ably.Realtime(options: ably.ClientOptions(key: 'ARq01A.1VYTtw:luCFDqbQU2IJDfa0Fy4wPPo-gRaBriUSolY9_16f0VI'));

  void logAblyEvent() async {
    // Access a channel where you want to log the event
    final channel = realtime.channels.get('testing salary');
    try {
      await channel.publish(message: ably.Message(name: 'eden'), name: 'edensss');
      print('Event logged successfully.');
    } catch (e) {
      print('Error logging event: $e');
    }
  }

  void mockStatusUpdates() async {
    final channel = realtime.channels.get('testing salary');

    try {
      await Future.delayed(Duration(seconds: 10));
      await channel.publish(message: ably.Message(name: 'eden'), name: 'order placed').then(
            (value) => setState(
              () {
                con.percent += 0.2;
              },
            ),
          );
      await Future.delayed(Duration(seconds: 10));
      await channel.publish(message: ably.Message(name: 'eden'), name: 'order in progress').then(
            (value) => setState(
              () {
                con.percent += 0.2;
              },
            ),
          );
      await Future.delayed(Duration(seconds: 10));
      await channel.publish(message: ably.Message(name: 'eden'), name: 'order picked').then(
            (value) => setState(
              () {
                con.percent += 0.2;
              },
            ),
          );
      await Future.delayed(Duration(seconds: 10));
      await channel.publish(message: ably.Message(name: 'eden'), name: 'order delivered').then(
            (value) => setState(
              () {
                con.percent += 0.2;
              },
            ),
          );
    } catch (e) {
      print('Error publishing status update: $e');
    }
  }

  @override
  void initState() {
    realtime.connect();
    mockStatusUpdates();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBgColor(),
        appBar: const AppBarWidget(
          automaticallyImplyLeading: false,
          title: 'Orders',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontStyle: FontStyle.normal,
          ),
          centerTitle: false,
        ),
        key: con.scaffoldKey,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                basicContainer(
                  color: Colors.white,
                  context: context,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Text(
                          'Order status',
                          style: AppTextStyles.boldFont15,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'Your order has been placed',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7, top: 20, bottom: 25, right: 7),
                        child: LinearPercentIndicator(
                          lineHeight: 8,
                          percent: con.percent,
                          progressColor: AppColors.mainBgColor(),
                          animation: true,
                          animationDuration: 1000,
                          barRadius: const Radius.circular(20),
                          backgroundColor: AppColors.mainBgColor().withOpacity(0.3),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 8, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            featuredNewBtn(
                              context,
                              text: 'Track order',
                              btnColor: AppColors.mainBgColor().withOpacity(0.7),
                              onPressed: () => {
                                logAblyEvent(),
                                // realtime.connection.on().listen((ably.AblyEventMessage message) async {
                                //   if (message.message == ably.ConnectionEvent.connected) {
                                //     // await subscriptionToBeCancelled.cancel()
                                //   }
                                // }),
                              },
                              btnTextColor: Colors.white,
                              height: 32,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Support ?',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                orderNameWidget(
                  context,
                  name: 'Samuel Usoroh',
                  orderId: 'Order ID',
                  orderIdValue: '#123457',
                  orderDate: 'Order Date',
                  orderDateValue: 'Thurs, 22nd 2023',
                  orderType: 'Order Type',
                  orderTypeValue: 'Scheduled',
                  paymentMethod: 'Payment Method',
                  paymentMethodValue: 'Bank Transfer',
                ),
                basicContainer(
                  color: AppColors.cardColor(),
                  context: context,
                  child: Column(
                    children: [
                      const Text(
                        'Cart items',
                        style: AppTextStyles.boldFont16,
                      ),
                      Column(
                        children: orders.map((order) {
                          return orderWidget(context, order);
                        }).toList(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
