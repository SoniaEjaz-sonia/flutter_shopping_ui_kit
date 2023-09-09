import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_shopping_ui_kit/models/product.dart';
import 'package:flutter_shopping_ui_kit/widgets/filter.dart';
import 'package:flutter_shopping_ui_kit/widgets/item_product.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProductList extends StatefulWidget {
  final Product? product;

  const ProductList({super.key, this.product});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  BorderRadiusGeometry radius = const BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  PanelController slidingUpController = PanelController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> widgetList = ['A', 'B', 'C', 'A', 'B', 'C', 'A', 'B', 'C', 'A', 'B', 'C', 'A', 'B', 'C'];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Man",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        leading: IconButton(
          icon: const Icon(Ionicons.ios_arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SizedBox(
              height: 18.0,
              width: 18.0,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  MaterialCommunityIcons.magnify,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SizedBox(
              height: 18.0,
              width: 18.0,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  MaterialCommunityIcons.heart_outline,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: SizedBox(
              height: 18.0,
              width: 18.0,
              child: IconButton(
                icon: const Icon(
                  MaterialCommunityIcons.cart_outline,
                ),
                color: Colors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: const ProductList(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SlidingUpPanel(
        controller: slidingUpController,
        minHeight: 42,
        color: Colors.blueGrey,
        panel: const Filter(),
        collapsed: Container(
          decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: radius),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              const Text(
                "Filter",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        borderRadius: radius,
        body: Container(
          padding: const EdgeInsets.only(top: 18),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: (itemWidth / itemHeight) * 1.1,
            controller: ScrollController(keepScrollOffset: false),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Center(
                child: TrendingItem(
                  product: Product(
                      company: 'Apple',
                      name: 'iPhone 11 (128GB)',
                      icon: 'assets/phone1.jpeg',
                      rating: 4.5,
                      remainingQuantity: 5,
                      price: '\$4,000'),
                  gradientColors: [const Color(0XFFa466ec), Colors.purple[400]!],
                ),
              ),
              Center(
                child: TrendingItem(
                  product: Product(
                      company: 'iPhone',
                      name: 'iPhone 11 (64GB)',
                      icon: 'assets/phone2.jpeg',
                      rating: 4.5,
                      price: '\$3,890'),
                  gradientColors: [const Color(0XFF6eed8c), Colors.green[400]!],
                ),
              ),
              Center(
                child: TrendingItem(
                  product: Product(
                      company: 'Xiaomi',
                      name: 'Xiaomi Redmi Note8',
                      icon: 'assets/mi1.png',
                      rating: 3.5,
                      price: '\$2,890'),
                  gradientColors: [const Color(0XFFf28767), Colors.orange[400]!],
                ),
              ),
              Center(
                child: TrendingItem(
                  product: Product(
                      company: 'Apple',
                      name: 'iPhone 11 (128GB)',
                      icon: 'assets/phone1.jpeg',
                      rating: 4.5,
                      remainingQuantity: 5,
                      price: '\$4,000'),
                  gradientColors: [const Color(0XFFa466ec), Colors.purple[400]!],
                ),
              ),
              Center(
                child: TrendingItem(
                  product: Product(
                      company: 'iPhone',
                      name: 'iPhone 11 (64GB)',
                      icon: 'assets/phone2.jpeg',
                      rating: 4.5,
                      price: '\$3,890'),
                  gradientColors: [const Color(0XFF6eed8c), Colors.green[400]!],
                ),
              ),
              Center(
                child: TrendingItem(
                  product: Product(
                      company: 'Xiaomi',
                      name: 'Xiaomi Redmi Note8',
                      icon: 'assets/mi1.png',
                      rating: 3.5,
                      price: '\$2,890'),
                  gradientColors: [const Color(0XFFf28767), Colors.orange[400]!],
                ),
              ),
              Center(
                child: TrendingItem(
                  product: Product(
                      company: 'Apple',
                      name: 'iPhone 11 (128GB)',
                      icon: 'assets/phone1.jpeg',
                      rating: 4.5,
                      remainingQuantity: 5,
                      price: '\$4,000'),
                  gradientColors: [const Color(0XFFa466ec), Colors.purple[400]!],
                ),
              ),
              Center(
                child: TrendingItem(
                  product: Product(
                      company: 'iPhone',
                      name: 'iPhone 11 (64GB)',
                      icon: 'assets/phone2.jpeg',
                      rating: 4.5,
                      price: '\$3,890'),
                  gradientColors: [const Color(0XFF6eed8c), Colors.green[400]!],
                ),
              ),
              Center(
                child: TrendingItem(
                  product: Product(
                      company: 'Xiaomi',
                      name: 'Xiaomi Redmi Note8',
                      icon: 'assets/mi1.png',
                      rating: 3.5,
                      price: '\$2,890'),
                  gradientColors: [const Color(0XFFf28767), Colors.orange[400]!],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
