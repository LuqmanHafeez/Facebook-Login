import 'package:facebooklogin/controllers/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login App"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: loginUI(),
    );
  }

  loginUI() async {
    return Consumer<LoginController>(builder: (_, model, child) {
      if (model.userDetails != null) {
        return loggedInUser(model);
      } else {
        return loggedInController(context);
      }
    });
  }

  loggedInUser(LoginController model) async {
    Center(
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage:
                Image.network(model.userDetails!.photoUrl ?? "").image,
          ),
          Text(model.userDetails!.displayName ?? ""),
          Text(model.userDetails!.email ?? ""),
        ],
      ),
    );
  }

  loggedInController(BuildContext context) async {
    GestureDetector(
      child: Image.asset("image/facebook.png"),
      onTap: () {
        Provider.of(context, listen: false).LoginController;
      },
    );
  }
}