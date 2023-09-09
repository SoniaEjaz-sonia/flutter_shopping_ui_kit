import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_shopping_ui_kit/models/product.dart';
import 'package:flutter_shopping_ui_kit/painters/circlepainters.dart';
import 'package:flutter_shopping_ui_kit/screens/products_list.dart';
import 'package:flutter_shopping_ui_kit/screens/search.dart';
import 'package:flutter_shopping_ui_kit/screens/shoppingcart.dart';
import 'package:flutter_shopping_ui_kit/screens/usersettings.dart';
import 'package:flutter_shopping_ui_kit/screens/whell.dart';
import 'package:flutter_shopping_ui_kit/utils/constant.dart';
import 'package:flutter_shopping_ui_kit/utils/navigator.dart';
import 'package:flutter_shopping_ui_kit/widgets/item_product.dart';
import 'package:flutter_shopping_ui_kit/widgets/occasions.dart';
import 'package:page_transition/page_transition.dart';

import 'checkout.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        drawer: Drawer(child: leftDrawerMenu()),
        appBar: buildAppBar(context),
        bottomNavigationBar: TabBar(
          tabs: const [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.attach_money)),
            Tab(icon: Icon(Icons.shopping_cart)),
            Tab(icon: Icon(Icons.account_circle))
          ],
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.blueGrey,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: const EdgeInsets.all(8.0),
          indicatorColor: Colors.red,
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const CategoriesListView(
                    title: "YOUR TITLES",
                    categories: [
                      'menu.png',
                      'tshirt.png',
                      'telephone.png',
                      'armchair.png',
                      'baby.png',
                      'lipstick.png',
                      'diamond.png',
                      'book.png'
                    ],
                    categoryTitle: ['All', 'Dress', 'Electronic', 'Home', 'Baby', 'Fashion', 'Jewel', 'Book'],
                  ),
                  buildCarouselSlider(),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children: <Widget>[
                        const Expanded(
                          child: Text(
                            "Popular Trendings",
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: const ProductList(),
                                ),
                              );
                            },
                            child: const Text(
                              "View All",
                              style: TextStyle(fontSize: 18.0, color: Colors.blue),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  buildTrending(),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children: <Widget>[
                        const Expanded(
                          child: Text(
                            "Best Selling",
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "View All",
                              style: TextStyle(fontSize: 18.0, color: Colors.blue),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  buildTrending(),
                  const Occasions(),
                  const Occasions(),
                ],
              ),
            ),
            const WheelFortune(),
            ShoppingCart(false),
            const UserSettings(),
          ],
        ),
      ),
    );
  }

  Column buildTrending() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              TrendingItem(
                product: Product(
                    company: 'Apple',
                    name: 'iPhone 11 (128GB)',
                    icon: 'assets/phone1.jpeg',
                    rating: 4.5,
                    remainingQuantity: 5,
                    price: '\$4,000'),
                gradientColors: [const Color(0XFFa466ec), Colors.purple[400]!],
              ),
              TrendingItem(
                product: Product(
                    company: 'iPhone',
                    name: 'iPhone 11 (64GB)',
                    icon: 'assets/phone2.jpeg',
                    rating: 4.5,
                    price: '\$3,890'),
                gradientColors: [const Color(0XFF6eed8c), Colors.green[400]!],
              ),
              TrendingItem(
                product: Product(
                    company: 'Xiaomi',
                    name: 'Xiaomi Redmi Note8',
                    icon: 'assets/mi1.png',
                    rating: 3.5,
                    price: '\$2,890'),
                gradientColors: [const Color(0XFFf28767), Colors.orange[400]!],
              ),
              TrendingItem(
                product: Product(
                    company: 'Apple',
                    name: 'iPhone 11 (128GB)',
                    icon: 'assets/phone1.jpeg',
                    rating: 4.5,
                    remainingQuantity: 5,
                    price: '\$4,000'),
                gradientColors: [const Color(0XFFa466ec), Colors.purple[400]!],
              ),
              TrendingItem(
                product: Product(
                    company: 'iPhone',
                    name: 'iPhone 11 (64GB)',
                    icon: 'assets/phone2.jpeg',
                    rating: 4.5,
                    price: '\$3,890'),
                gradientColors: [const Color(0XFF6eed8c), Colors.green[400]!],
              ),
              TrendingItem(
                product: Product(
                    company: 'Xiaomi',
                    name: 'Xiaomi Redmi Note8',
                    icon: 'assets/mi1.png',
                    rating: 3.5,
                    price: '\$2,890'),
                gradientColors: [const Color(0XFFf28767), Colors.orange[400]!],
              ),
              TrendingItem(
                product: Product(
                    company: 'Apple',
                    name: 'iPhone 11 (128GB)',
                    icon: 'assets/phone1.jpeg',
                    rating: 4.5,
                    remainingQuantity: 5,
                    price: '\$4,000'),
                gradientColors: [const Color(0XFFa466ec), Colors.purple[400]!],
              ),
              TrendingItem(
                product: Product(
                    company: 'iPhone',
                    name: 'iPhone 11 (64GB)',
                    icon: 'assets/phone2.jpeg',
                    rating: 4.5,
                    price: '\$3,890'),
                gradientColors: [const Color(0XFF6eed8c), Colors.green[400]!],
              ),
              TrendingItem(
                product: Product(
                    company: 'Xiaomi',
                    name: 'Xiaomi Redmi Note8',
                    icon: 'assets/mi1.png',
                    rating: 3.5,
                    price: '\$2,890'),
                gradientColors: [const Color(0XFFf28767), Colors.orange[400]!],
              ),
            ],
          ),
        )
      ],
    );
  }

  CarouselSlider buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        viewportFraction: 0.9,
        aspectRatio: 16 / 9,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: imgList.map(
        (url) {
          return Stack(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                    width: 1000.0,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Sunny Getaways",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Lorem Ipsım Dolar Lorem Ipsım Dolar Lorem Ipsım Dolar",
                            style: TextStyle(color: Colors.white, fontSize: 14)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ).toList(),
    );
  }

  BottomNavyBar buildBottomNavyBar(BuildContext context) {
    return BottomNavyBar(
      selectedIndex: currentIndex,
      showElevation: true,
      onItemSelected: (index) => setState(() {
        currentIndex = index;
      }),
      items: [
        BottomNavyBarItem(
          icon: const Icon(Icons.home),
          title: const Text('Home'),
          activeColor: Theme.of(context).primaryColor,
        ),
        BottomNavyBarItem(
            icon: const Icon(Icons.apps), title: const Text('Categories'), activeColor: Theme.of(context).primaryColor),
        BottomNavyBarItem(
            icon: const Icon(Icons.shopping_cart),
            title: const Text('Shopping Cart'),
            activeColor: Theme.of(context).primaryColor),
        BottomNavyBarItem(
            icon: const Icon(Icons.shopping_basket),
            title: const Text('Orders'),
            activeColor: Theme.of(context).primaryColor),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "Flutter Ecommerce Design",
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      leading: IconButton(
          icon: const Icon(MaterialCommunityIcons.menu, color: Colors.black),
          onPressed: () => _scaffoldKey.currentState?.openDrawer()),
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const Search(),
              ),
            );
          },
          child: const Icon(
            MaterialCommunityIcons.magnify,
            color: Colors.black,
          ),
        ),
        IconButton(
          icon: const Icon(
            MaterialCommunityIcons.cart_outline,
          ),
          color: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: ShoppingCart(true),
              ),
            );
          },
        ),
      ],
      backgroundColor: Colors.white,
    );
  }

  leftDrawerMenu() {
    Color blackColor = Colors.black.withOpacity(0.6);
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          height: 150,
          child: DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFFF8FAFB),
            ),
            child: ListTile(
              trailing: const Icon(
                Icons.chevron_right,
                size: 28,
              ),
              subtitle: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: const UserSettings(),
                    ),
                  );
                },
                child: Text(
                  "See Profile",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: blackColor),
                ),
              ),
              title: Text(
                "Ali Anıl Koçak",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: blackColor),
              ),
              leading: const CircleAvatar(
                backgroundImage: NetworkImage("https://miro.medium.com/fit/c/256/256/1*mZ3xXbns5BiBFxrdEwloKg.jpeg"),
              ),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Feather.home,
            color: blackColor,
          ),
          title: Text(
            'Home',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: blackColor),
          ),
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const Home(),
              ),
            );
          },
        ),
        ListTile(
          trailing: const Icon(
            Ionicons.ios_radio_button_on,
            color: Color(0xFFFB7C7A),
            size: 18,
          ),
          leading: Icon(Feather.gift, color: blackColor),
          title:
              Text('Wheel Spin(Free)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: blackColor)),
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const WheelFortune(),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Feather.search, color: blackColor),
          title: Text('Search', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: blackColor)),
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const Search(),
              ),
            );
          },
        ),
        ListTile(
          trailing: const Icon(
            Ionicons.ios_radio_button_on,
            color: Color(0xFFFB7C7A),
            size: 18,
          ),
          leading: Icon(Feather.bell, color: blackColor),
          title: Text('Notifications', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: blackColor)),
          onTap: () {
            Nav.route(context, Checkout());
          },
        ),
        ListTile(
          trailing: const Icon(
            Icons.looks_two,
            color: Color(0xFFFB7C7A),
            size: 18,
          ),
          leading: Icon(Feather.shopping_cart, color: blackColor),
          title: Text('Shopping Cart', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: blackColor)),
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: ShoppingCart(true),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Feather.list, color: blackColor),
          title: Text('My Orders', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: blackColor)),
          onTap: () {
            Nav.route(context, const ProductList());
          },
        ),
        ListTile(
          leading: Icon(Feather.award, color: blackColor),
          title: Text('Points', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: blackColor)),
          onTap: () {
            Nav.route(context, Checkout());
          },
        ),
        ListTile(
          leading: Icon(Feather.message_circle, color: blackColor),
          title: Text('Support', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: blackColor)),
          onTap: () {
            Nav.route(context, const ProductList());
          },
        ),
        ListTile(
          leading: Icon(Feather.help_circle, color: blackColor),
          title: Text('Help', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: blackColor)),
          onTap: () {
            Nav.route(context, const UserSettings());
          },
        ),
        ListTile(
          leading: Icon(Feather.settings, color: blackColor),
          title: Text('Settings', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: blackColor)),
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const UserSettings(),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Feather.x_circle, color: blackColor),
          title: Text('Quit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: blackColor)),
          onTap: () {
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          },
        ),
      ],
    );
  }
}

class CategoriesListView extends StatelessWidget {
  final String title;
  final List<String> categories;
  final List<String> categoryTitle;

  const CategoriesListView({Key? key, required this.title, required this.categories, required this.categoryTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 12),
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: const ProductList(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: 55,
                          height: 55,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.blueGrey,
                              width: 1,
                            ),
                          ),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/images/${categories[index]}"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            categoryTitle[index],
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Regular',
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
