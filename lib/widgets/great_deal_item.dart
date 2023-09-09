import 'package:flutter/material.dart';

class GreatDealItem extends StatelessWidget {
  const GreatDealItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 10, top: 5),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0XFF72e1ba),
                  Color(0XFFfefeff),
                ],
                stops: [0.0, 0.8],
              ),
            ),
            child: Column(
              children: <Widget>[
                const Row(
                  children: <Widget>[
                    Icon(Icons.landscape),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Explore the wide range of',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                        const Text(
                          'UNDER ARMOUR',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                        ),
                        const Text('Collections'),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          color: Colors.black,
                          padding: const EdgeInsets.only(left: 7.0, right: 7.0, top: 2.0, bottom: 2.0),
                          child: const Text(
                            'shop now',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            right: -32,
            top: -10,
            child: Image.asset(
              'assets/great_foot.png',
              width: 310,
              height: 150,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
