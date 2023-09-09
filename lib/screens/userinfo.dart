import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Add New Address"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusColor: Theme.of(context).primaryColorLight,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColorLight, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColorLight, width: 1.0),
                    ),
                    hintText: 'Enter a name',
                    labelText: "Name",
                    prefixText: "",
                    suffixIcon: const Icon(Icons.person_pin),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusColor: Theme.of(context).primaryColorLight,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColorLight, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColorLight, width: 1.0),
                    ),
                    hintText: 'Enter a surname',
                    labelText: "Surname",
                    suffixIcon: const Icon(Icons.person_add),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusColor: Theme.of(context).primaryColorLight,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColorLight, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColorLight, width: 1.0),
                    ),
                    hintText: 'Enter a Telephone text',
                    labelText: "text",
                    suffixIcon: const Icon(Icons.mobile_screen_share),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      focusColor: Theme.of(context).primaryColorLight,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).primaryColorLight, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).primaryColorLight, width: 1.0),
                      ),
                      hintText: 'Enter a valid adress',
                      labelText: "Adress",
                      suffixIcon: const Icon(Icons.location_on)),
                ),
                const SizedBox(height: 16),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(20.0),
                    focusColor: Theme.of(context).primaryColorLight,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColorLight, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColorLight, width: 1.0),
                    ),
                    hintText: 'Enter a adress name(ex:Home,Office)',
                    labelText: "Adress Name",
                    suffixIcon: const Icon(Icons.location_city),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusColor: Theme.of(context).primaryColorLight,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColorLight, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColorLight, width: 1.0),
                    ),
                    hintText: 'Enter a valid ZIP-Code',
                    labelText: "Zip Code",
                    suffixIcon: const Icon(Icons.chrome_reader_mode),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
