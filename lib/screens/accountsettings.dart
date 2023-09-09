import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  final ParentStyle settingsItemIconStyle = ParentStyle()
    ..padding(all: 8)
    ..borderRadius(all: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account Settings",
          style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Ionicons.ios_arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Card(
                elevation: 1,
                child: ListTile(
                  title: Text(
                    "My Brands",
                    style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 18),
                  ),
                  leading: Parent(
                    style: ParentStyle()
                      ..background.color(const Color(0xFF9F6083))
                      ..add(settingsItemIconStyle),
                    child: const Icon(
                      Feather.package,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Card(
                elevation: 1,
                child: ListTile(
                  title: Text(
                    "My Information",
                    style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 18),
                  ),
                  leading: Parent(
                    style: ParentStyle()
                      ..background.color(const Color(0xFFFDB78B))
                      ..add(settingsItemIconStyle),
                    child: const Icon(
                      Feather.user,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Card(
                elevation: 1,
                child: ListTile(
                  title: Text(
                    "Address",
                    style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 18),
                  ),
                  leading: Parent(
                    style: ParentStyle()
                      ..background.color(const Color(0xFF57CFE2))
                      ..add(settingsItemIconStyle),
                    child: const Icon(
                      Feather.map_pin,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Card(
                elevation: 1,
                child: ListTile(
                  title: Text(
                    "Credit Cards",
                    style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 18),
                  ),
                  leading: Parent(
                    style: ParentStyle()
                      ..background.color(const Color(0xFF606B7E))
                      ..add(settingsItemIconStyle),
                    child: const Icon(
                      Feather.credit_card,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Card(
                elevation: 1,
                child: ListTile(
                  title: Text(
                    "Change Password",
                    style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 18),
                  ),
                  leading: Parent(
                    style: ParentStyle()
                      ..background.color(const Color(0xFF24ACE9))
                      ..add(settingsItemIconStyle),
                    child: const Icon(
                      Feather.lock,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              child: Card(
                elevation: 1,
                child: ListTile(
                  title: Text(
                    "Exit",
                    style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 18),
                  ),
                  leading: Parent(
                    style: ParentStyle()
                      ..background.color(const Color(0xFFFB7C7A))
                      ..add(settingsItemIconStyle),
                    child: const Icon(
                      Feather.log_out,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
