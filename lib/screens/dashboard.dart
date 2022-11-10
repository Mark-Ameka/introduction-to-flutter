import 'package:flutter/material.dart';
import 'package:myproject/screens/settings.dart';

class Dashboard extends StatelessWidget {
  static String route_name = "/dashboard";
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Settings.route_name);
            },
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.settings, size: 30),
            ),
          )
        ],
      ),
      body: const Center(
        child: Text("Hello"),
      ),
    );
  }
}
