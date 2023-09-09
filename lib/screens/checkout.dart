import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_shopping_ui_kit/utils/navigator.dart';

import 'home.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Checkout",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        leading: IconButton(
          icon: const Icon(Ionicons.ios_arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0, bottom: 12.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: 6.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text("Delivery Adress"),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 12.0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                        color: const Color(0xFFE7F9F5),
                        border: Border.all(
                          color: const Color(0xFF4CD7A5),
                        ),
                      ),
                      child: const ListTile(
                        trailing: Icon(
                          Icons.check_circle,
                          color: Color(0xFF10CA88),
                        ),
                        title: Text('HOME ADRESS'),
                        subtitle: Text("125 Lorem Ipsum"),
                      ),
                    ),
                    const Text("Payment method"),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 12.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Color(0xFFF5F8FB),
                      ),
                      child: const ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Colors.black54,
                        ),
                        title: Text('test@gmail.com'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 12.0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                        color: const Color(0xFFE7F9F5),
                        border: Border.all(
                          color: const Color(0xFF4CD7A5),
                        ),
                      ),
                      child: const ListTile(
                        trailing: Icon(
                          Icons.check_circle,
                          color: Color(0xFF10CA88),
                        ),
                        leading: Icon(
                          Icons.credit_card,
                          color: Color(0xFF10CA88),
                        ),
                        title: Text('**** **** 2222 4444'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 12.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Color(0xFFF5F8FB),
                      ),
                      child: const ListTile(
                        leading: Icon(
                          Icons.card_membership,
                          color: Colors.black54,
                        ),
                        title: Text('**** **** 1111 2222'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 24.0),
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color(0xFFF93963)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                        onPressed: () => {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              shape:
                                  const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                              content: SizedBox(
                                height: MediaQuery.of(context).size.height / 1.8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    const Icon(
                                      Icons.check_circle_outline,
                                      size: 96,
                                      color: Color(0xFF10CA88),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 16.0),
                                      child: Text(
                                        "Your order successfull",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 16.0),
                                      child: Text(
                                        "Your can track the delivery in the Orders section ",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(const Color(0xFFF93963)),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      onPressed: () => {},
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15.0,
                                          horizontal: 10.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  Nav.route(context, const Home());
                                                },
                                                child: const Text(
                                                  "Continue Shopping",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      child: const Text("Go to orders"),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
                                  "Payment",
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
          ),
        ),
      ),
    );
  }
}
