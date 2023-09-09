import 'package:flutter/material.dart';
import 'package:flutter_shopping_ui_kit/utils/codeinput.dart';
import 'package:flutter_shopping_ui_kit/utils/progressdialog.dart';

import 'home.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  ProgressDialog? pr;

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context, ProgressDialogType.Normal);
    pr!.setMessage('Verifying account...');

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 96.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text("Phone Verification", style: Theme.of(context).textTheme.titleMedium),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 48.0),
                  child: Text(
                    "Enter your code here",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 64.0),
                  child: CodeInput(
                    length: 4,
                    keyboardType: TextInputType.number,
                    builder: CodeInputBuilders.darkCircle(),
                    onFilled: (value) async {
                      pr!.show();
                      Future.delayed(const Duration(milliseconds: 1500), () {
                        setState(() {
                          pr!.hide();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        });
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "Didn't you received any code?",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    ),
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      "Resend new code",
                      style: TextStyle(
                        fontSize: 19,
                        color: Theme.of(context).primaryColor,
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
}
