import 'package:flutter/material.dart';
import 'package:myproject/routes.dart';
import 'package:myproject/screens/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Login.route_name,
    routes: routes,
  ));
}
