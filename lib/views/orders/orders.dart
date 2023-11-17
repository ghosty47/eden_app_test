import 'package:eden_app_test/controllers/orders_controller.dart';
import 'package:eden_app_test/utils/app_colors.dart';
import 'package:eden_app_test/utils/app_styles.dart';
import 'package:eden_app_test/utils/orders_data.dart';
import 'package:eden_app_test/views/orders/orders_list.dart';
import 'package:eden_app_test/widgets/app_bar_widget.dart';
import 'package:eden_app_test/widgets/basic_container_widget.dart';
import 'package:eden_app_test/widgets/cart_widget.dart';
import 'package:eden_app_test/widgets/featured_button_widget.dart';
import 'package:eden_app_test/widgets/order_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

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

  // void logAblyEvent() async {
  //   // Access a channel where you want to log the event
  //   final channel = realtime.channels.get('testing salary');
  //   try {
  //     await channel.publish(message: ably.Message(name: 'eden'), name: 'edensss');
  //     print('Event logged successfully.');
  //   } catch (e) {
  //     print('Error logging event: $e');
  //   }
  // }

  @override
  void initState() {
    con.realtime.connect();
    con.mockStatusUpdates();

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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(con.orderText),
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
                              onPressed: () => pushNewScreen(
                                context,
                                screen: const OrderDetailsView(),
                                withNavBar: false,
                              ),
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
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 25),
                  child: basicContainer(
                    color: AppColors.cardColor(),
                    context: context,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20, left: 15, bottom: 20),
                          child: Text(
                            'Cart items',
                            style: AppTextStyles.boldFont18,
                          ),
                        ),
                        Column(
                          children: orders.map((order) {
                            return orderWidget(context, order);
                          }).toList(),
                        ),
                      ],
                    ),
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
