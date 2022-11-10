import 'package:flutter/material.dart';
import 'package:myproject/screens/login.dart';

class Settings extends StatelessWidget {
  static String route_name = "/settings";
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                Login.route_name,
                (Route<dynamic> route) => false,
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.logout, size: 30),
            ),
          )
        ],
      ),
      body: const Center(
        child: Text("Dashboard"),
      ),
    );
  }
}
