import 'package:eden_app_test/model/orders.dart';
import 'package:eden_app_test/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';

Widget orderWidget(BuildContext context, Orders f) {
  return InkWell(
    onTap: () {},
    child: Column(
      children: [
        ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: networkImage(
              f.imgUrl,
              width: 56,
              height: 54,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            f.title!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          subtitle: Text(
            f.quantity!,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Colors.blue,
            ),
          ),
          trailing: Text(
            f.price!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          child: Divider(
            thickness: 0.25,
          ),
        )
      ],
    ),
  );
}
