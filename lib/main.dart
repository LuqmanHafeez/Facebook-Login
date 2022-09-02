import 'package:facebooklogin/controllers/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginController>(create: (context) {
          return LoginController();
        })
      ],
      child: const MaterialApp(
        title: "Facebook Login",
      ),
    ),
  );
}
