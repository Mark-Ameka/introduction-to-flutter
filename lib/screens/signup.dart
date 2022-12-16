import 'package:flutter/material.dart';
import 'package:myproject/screens/login.dart';
import 'package:myproject/services/Authentication.dart';
import 'package:myproject/widgets/Button.dart';
import 'package:myproject/widgets/TextInput.dart';
import 'package:myproject/widgets/PassInput.dart';

class Signup extends StatefulWidget {
  static String route_name = '/signup';
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController conpassController = TextEditingController();

  // ignore: non_constant_identifier_names
  bool obsure_pass = true;
  Authentication _authService = Authentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'JOIN US',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Set up an account',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  //First Name Field
                  TextInput(
                      label: "First Name",
                      hint: "Enter your first name",
                      controller: fnameController,
                      input: TextInputType.name),
                  //Gap
                  const SizedBox(
                    height: 5.0,
                  ),
                  //First Name Field
                  TextInput(
                      label: "First Name",
                      hint: "Enter your last name",
                      controller: lnameController,
                      input: TextInputType.name),
                  //Gap
                  const SizedBox(
                    height: 5.0,
                  ),
                  //Email Field
                  TextInput(
                      label: "Email Address",
                      hint: "Enter your email address",
                      controller: emailController,
                      input: TextInputType.emailAddress),
                  //Gap
                  const SizedBox(
                    height: 5.0,
                  ),
                  //Pass Field
                  PassInput(
                      obscure: obsure_pass,
                      event: set_icon,
                      label: "Password",
                      hint: "Enter your password",
                      controller: passController),
                  //Conpass Field
                  const SizedBox(
                    height: 5.0,
                  ),
                  PassInput(
                      obscure: obsure_pass,
                      event: set_icon,
                      label: "Confirm Password",
                      hint: "Confirm password",
                      controller: conpassController),
                  //Gap
                  const SizedBox(
                    height: 80.0,
                  ),
                  //Signup Button
                  Button(
                    text: "SIGNUP",
                    event: (() {
                      signUpWithProvider();
                    }),
                  ),
                  //Gap
                  const SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          Login.route_name,
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: const Text(
                        "I have an account",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  set_icon() {
    setState(() {
      obsure_pass = !obsure_pass;
    });
  }

  signUpWithProvider() async {
    try {
      var user = await _authService.signInWithGoogle();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, Login.route_name);
    } catch (e) {}
  }
}
