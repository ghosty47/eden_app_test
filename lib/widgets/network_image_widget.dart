import 'package:cached_network_image/cached_network_image.dart';
import 'package:eden_app_test/utils/base.dart';
import 'package:flutter/material.dart';

Widget networkImage(
  String? u, {
  double height = 40,
  double width = 35,
  double loaderHeight = 20,
  double loaderWidth = 20,
  BoxFit fit = BoxFit.contain,
}) {
  if (u == null || u == "") {
    return Image.asset("assets/images/logo.png", width: 35, height: 40, fit: BoxFit.cover);
  }

  return CachedNetworkImage(
    imageUrl: u,
    height: height,
    width: width,
    fit: fit,
    placeholder: (context, url) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      padding: const EdgeInsets.only(top: 8.0),
      child: Center(child: Utility.loader(width: loaderHeight, height: loaderWidth)),
    ),
    errorWidget: (context, url, error) => Image.asset(
      "assets/images/logo.png",
      width: 35,
      height: 25,
      fit: BoxFit.cover,
    ),
  );
}
