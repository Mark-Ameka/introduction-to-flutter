import 'package:flutter/material.dart';
import 'package:myproject/screens/login.dart';
import 'package:myproject/services/Authentication.dart';
import 'package:myproject/services/StorageService.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});
  static String route_name = "/settings";

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  StorageService _storageService = StorageService();
  Authentication _authService = Authentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () async {
              await _authService.logout();
              _storageService.deleteAllData();
              // ignore: use_build_context_synchronously
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
