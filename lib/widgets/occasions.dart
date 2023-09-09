import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_shopping_ui_kit/screens/product.dart';
import 'package:flutter_shopping_ui_kit/utils/navigator.dart';
import 'package:flutter_shopping_ui_kit/widgets/star_rating.dart';

import '../models/product.dart';

class Occasions extends StatelessWidget {
  const Occasions({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Nav.route(
          context,
          ProductPage(
            product: Product(
              company: 'Apple',
              name: 'iPhone 7 plus (128GB)',
              icon: 'assets/iphone_7.png',
              rating: 4.5,
              remainingQuantity: 5,
              price: '\$2,000',
            ),
          ),
        );
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 220,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Mobile Special Offer",
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start,
                      ),
                      Icon(
                        SimpleLineIcons.screen_smartphone,
                        color: Colors.black54,
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.0),
                    child: Divider(
                      color: Colors.black12,
                      height: 1,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/iphone_x.png',
                              height: 120, width: MediaQuery.of(context).size.width / 3),
                        ),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Container(
                        height: 142,
                        decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                "06 : 43 : 32",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.0),
                                child: Text(
                                  "Iphone Xs Max",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              ),
                              const Row(
                                children: <Widget>[
                                  Text(
                                    "5.365 TL",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    '#6.789',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12, decoration: TextDecoration.lineThrough),
                                  )
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 4.0),
                                child: StarRating(rating: 4, size: 10),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 4.0),
                                child: Text("Free Cargo"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  "Last 11 Item",
                                  style: TextStyle(color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
