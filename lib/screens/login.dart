import 'package:flutter/material.dart';
import 'package:flutter_shopping_ui_kit/screens/register.dart';
import 'package:flutter_shopping_ui_kit/screens/verifynumber.dart';
import 'package:flutter_shopping_ui_kit/utils/progressdialog.dart';
import 'package:flutter_shopping_ui_kit/widgets/edittext.dart';
import 'package:flutter_shopping_ui_kit/widgets/submitbutton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ProgressDialog? progressDialog;

  @override
  Widget build(BuildContext context) {
    progressDialog = ProgressDialog(context, ProgressDialogType.Normal);
    progressDialog!.setMessage('Logging in...');

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text("Welcome", style: Theme.of(context).textTheme.titleLarge),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text("Login to your account", style: Theme.of(context).textTheme.titleSmall),
              ),
              const EditText(title: "Email"),
              const EditText(title: "Password"),
              SubmitButton(
                title: "Login",
                act: () async {
                  progressDialog!.show();
                  Future.delayed(const Duration(milliseconds: 1500), () {
                    setState(() {
                      progressDialog!.hide();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VerifyScreen(),
                        ),
                      );
                    });
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.all(32.0),
                child: Text("Forgot your password?"),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account?  ",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
