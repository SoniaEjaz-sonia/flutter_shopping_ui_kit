import 'package:flutter/material.dart';
import 'package:flutter_shopping_ui_kit/screens/login.dart';
import 'package:flutter_shopping_ui_kit/screens/verifynumber.dart';
import 'package:flutter_shopping_ui_kit/widgets/edittext.dart';
import 'package:flutter_shopping_ui_kit/widgets/submitbutton.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Welcome",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Text(
                  "Register account",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const EditText(title: "Name"),
              const EditText(title: "Surname"),
              const EditText(title: "Email"),
              const EditText(title: "Password"),
              SubmitButton(
                title: "Register",
                act: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VerifyScreen(),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Already exist account? ",
                      style: TextStyle(fontSize: 17),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
