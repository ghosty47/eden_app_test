import 'package:eden_app_test/controllers/ably_controller.dart';
import 'package:eden_app_test/controllers/orders_controller.dart';
import 'package:eden_app_test/utils/app_colors.dart';
import 'package:eden_app_test/utils/constants.dart';
import 'package:eden_app_test/widgets/app_bar_widget.dart';
import 'package:eden_app_test/widgets/basic_container_widget.dart';
import 'package:eden_app_test/widgets/timeline_widget.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';

class OrderDetailsView extends StatefulWidget {
  const OrderDetailsView({Key? key}) : super(key: key);

  @override
  OrderDetailsViewState createState() => OrderDetailsViewState();
}

class OrderDetailsViewState extends StateMVC<OrderDetailsView> {
  OrderDetailsViewState() : super(OrdersController()) {
    con = controller as OrdersController;
  }

  late OrdersController con;

  @override
  void initState() {
    // con.realtime.connect();
    // con.mockStatusUpdates();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBgColor(),
        appBar: const AppBarWidget(
          automaticallyImplyLeading: true,
          title: 'Orders details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontStyle: FontStyle.normal,
          ),
          centerTitle: true,
        ),
        key: con.scaffoldKey,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: basicContainer(
              margin: const EdgeInsets.only(bottom: 30, top: 20),
              color: AppColors.cardColor(),
              context: context,
              child: Column(
                children: [
                  timelineWidget(
                    context,
                    isFirst: true,
                    isLast: false,
                    isPast: true,
                    eventCard: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            kOrderPlaced,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Text(
                              'Waiting for the vendor to accept your order',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  timelineWidget(context,
                      isFirst: false,
                      isLast: false,
                      isPast: Provider.of<AblyTracker>(context, listen: true).percent >= 0.2 ? true : false,
                      eventCard: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              kOrderAccepted,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(top: 6),
                              child: Text(
                                'The vendor is preparing your order',
                              ),
                            ),
                          ),
                        ],
                      )),
                  timelineWidget(context,
                      isFirst: false,
                      isLast: false,
                      isPast: Provider.of<AblyTracker>(context, listen: true).percent >= 0.4 ? true : false,
                      eventCard: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              kOrderPickUP,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(top: 6),
                              child: Text(
                                'A rider is on his way pickup your order',
                              ),
                            ),
                          ),
                        ],
                      )),
                  timelineWidget(
                    context,
                    isFirst: false,
                    isLast: false,
                    isPast: Provider.of<AblyTracker>(context, listen: true).percent >= 0.6 ? true : false,
                    eventCard: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            kOrderOnTransit,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Text(
                              'The rider has picked up your order',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  timelineWidget(
                    context,
                    isFirst: false,
                    isLast: false,
                    isPast: Provider.of<AblyTracker>(context, listen: true).percent >= 0.8 ? true : false,
                    eventCard: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            kOrderArrived,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Text(
                              "Don't keep the rider waiting!",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  timelineWidget(
                    context,
                    isFirst: false,
                    isLast: true,
                    isPast: Provider.of<AblyTracker>(context, listen: true).percent >= 1.0 ? true : false,
                    eventCard: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            kOrderDelivered,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Text(
                              'Enjoy !',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
