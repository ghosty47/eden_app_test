import 'package:eden_app_test/views/orders/orders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class AuthController extends ControllerMVC {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? user;

  bool processing = true;
  String selectedRole = '';
  OverlayEntry? loader;


  void signInWithGoogle(BuildContext context) {
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      auth.signInWithProvider(googleAuthProvider);
  } catch (error) {
      print(error);
    }
  }

  AuthController();
}
