import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_shopping_ui_kit/models/product.dart';
import 'package:flutter_shopping_ui_kit/screens/product.dart';
import 'package:flutter_shopping_ui_kit/widgets/star_rating.dart';

class TrendingItem extends StatelessWidget {
  final Product? product;
  final List<Color>? gradientColors;

  const TrendingItem({super.key, this.product, this.gradientColors});

  @override
  Widget build(BuildContext context) {
    double trendCardWidth = 140;

    return GestureDetector(
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: trendCardWidth,
            child: Card(
              elevation: 2,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    const Row(
                      children: <Widget>[
                        Spacer(),
                        Icon(
                          Ionicons.ios_heart_empty,
                          color: Colors.black54,
                        )
                      ],
                    ),
                    _productImage(),
                    _productDetails()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductPage(product: product!),
          ),
        );
      },
    );
  }

  _productImage() {
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(product!.icon!), fit: BoxFit.contain),
            ),
          ),
        )
      ],
    );
  }

  _productDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          product!.company!,
          style: const TextStyle(fontSize: 12, color: Color(0XFFb1bdef)),
        ),
        Text(
          product!.name!,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
        ),
        StarRating(rating: product!.rating, size: 10),
        Row(
          children: <Widget>[
            Text(product!.price!, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red)),
            const Text(
              '#00.000',
              style: TextStyle(color: Colors.grey, fontSize: 10, decoration: TextDecoration.lineThrough),
            )
          ],
        )
      ],
    );
  }
}
