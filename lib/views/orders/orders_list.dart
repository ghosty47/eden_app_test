import 'package:eden_app_test/controllers/orders_controller.dart';
import 'package:eden_app_test/utils/app_colors.dart';
import 'package:eden_app_test/utils/constants.dart';
import 'package:eden_app_test/widgets/app_bar_widget.dart';
import 'package:eden_app_test/widgets/basic_container_widget.dart';
import 'package:eden_app_test/widgets/timeline_widget.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

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
              color: AppColors.cardColor(),
              context: context,
              child: Column(
                children: [
                  timelineWidget(context,
                      isFirst: true,
                      isLast: false,
                      isPast: true,
                      eventCard: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(child: Text(kOrderPlaced)),
                          Flexible(
                            child: Text(
                              'Waiting for the vendor to accept your order',
                            ),
                          ),
                        ],
                      )),
                  timelineWidget(context,
                      isFirst: false,
                      isLast: false,
                      isPast: true,
                      eventCard: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              kOrderPlaced,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              'Waiting for the vendor to accept your order',
                            ),
                          ),
                        ],
                      )),
                  timelineWidget(context,
                      isFirst: false,
                      isLast: true,
                      isPast: false,
                      eventCard: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              kOrderPlaced,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              'Waiting for the vendor to accept your order',
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
