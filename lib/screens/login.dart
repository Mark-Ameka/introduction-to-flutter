import 'package:flutter/material.dart';
import 'package:myproject/models/StorageItem.dart';
import 'package:myproject/screens/dashboard.dart';
import 'package:myproject/screens/signup.dart';
import 'package:myproject/services/Authentication.dart';
import 'package:myproject/services/StorageService.dart';
import 'package:myproject/widgets/Button.dart';
import 'package:myproject/widgets/TextInput.dart';
import 'package:myproject/widgets/PassInput.dart';

class Login extends StatefulWidget {
  static String route_name = '/login';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  StorageService _storageService = StorageService();
  Authentication _authService = Authentication();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  // ignore: non_constant_identifier_names
  bool obsure_pass = true;
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Be a part of us',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                //Email Field
                TextInput(
                    label: "Email Address",
                    hint: "Enter your email address",
                    controller: emailController,
                    input: TextInputType.emailAddress),
                //Gap
                const SizedBox(
                  height: 20.0,
                ),
                //Pass Field
                PassInput(
                    obscure: obsure_pass,
                    event: set_icon,
                    label: "Password",
                    hint: "Enter your password",
                    controller: passController),
                const SizedBox(
                  height: 20.0,
                ),
                //Checkbox
                checkboxFunction(),
                //Gap
                const SizedBox(
                  height: 20.0,
                ),
                //Login Button
                Button(
                  text: "LOGIN",
                  event: (() {
                    loginWithProvider();
                  }),
                ),
                //Gap
                const SizedBox(
                  height: 20.0,
                ),
                //Sign up Link
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, Signup.route_name);
                    },
                    child: const Text(
                      "I don't have an account",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget checkboxFunction() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          leading: Checkbox(
            value: value,
            onChanged: (value) {
              setState(() {
                this.value = value!;
              });
            },
          ),
          title: const Text(
            'Remember me',
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  set_icon() {
    setState(() {
      obsure_pass = !obsure_pass;
    });
  }

  loginWithProvider() async {
    try {
      var user = await _authService.signInWithGoogle();
      var accessToken =
          StorageItem("accessToken", user.credential?.accessToken as String);

      await _storageService.saveData(accessToken);

      if (accessToken.key.isNotEmpty) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, Dashboard.route_name);
      }
    } catch (e) {}
  }
}
