import 'package:flutter/cupertino.dart';
import 'package:myproject/screens/dashboard.dart';
import 'package:myproject/screens/login.dart';
import 'package:myproject/screens/settings.dart';
import 'package:myproject/screens/signup.dart';

final Map<String, WidgetBuilder> routes = {
  Login.route_name: (BuildContext context) => const Login(),
  Dashboard.route_name: (BuildContext context) => const Dashboard(),
  Settings.route_name: (BuildContext context) => const Settings(),
  Signup.route_name: (BuildContext context) => const Signup(),
};
