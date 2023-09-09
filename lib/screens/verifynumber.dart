import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_ui_kit/screens/verificationcode.dart';
import 'package:flutter_shopping_ui_kit/widgets/socialbottomsheet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final _txtNumber = TextEditingController();
  String _txtNumberHint = "05078596252";

  @override
  void initState() {
    _txtNumber.addListener(() {
      setState(() {
        _txtNumberHint = _txtNumber.text;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 96.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    "Verify your phone number",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 36.0),
                  child: Text(
                    "We have sent you an SMS with a code to number +90$_txtNumberHint",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0, bottom: 8.0, left: 24.0, right: 24.0),
                      child: TextField(
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).dividerColor,
                          hintStyle: Theme.of(context).textTheme.titleSmall,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: const EdgeInsets.all(16),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 36.0, bottom: 8.0, left: 36.0, right: 24.0),
                      child: CountryPickerDropdown(
                        initialValue: 'tr',
                        itemBuilder: _buildDropdownItem,
                        onValuePicked: (Country country) {
                          debugPrint(country.name);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0, bottom: 8.0, left: 184.0, right: 24.0),
                      child: TextField(
                        controller: _txtNumber,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              FontAwesomeIcons.circleXmark,
                              color: Theme.of(context).primaryColorLight,
                            ),
                            onPressed: () {
                              setState(() {
                                _txtNumber.text = "";
                              });
                            },
                          ),
                          hintText: "I  Number",
                          hintStyle: Theme.of(context).textTheme.titleSmall,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(16),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 36.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Or login with   ",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      GestureDetector(
                        onTap: () {
                          socialBottomSheet(context);
                        },
                        child: Text(
                          "Social Network",
                          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFF93963)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                            ),
                            onPressed: () => {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const VerificationScreen()),
                              ),
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 10.0,
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      "Next",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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

Widget _buildDropdownItem(Country country) => Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          "+${country.phoneCode}(${country.isoCode})",
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );

void socialBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return const SocialBottomSheet();
      });
}
