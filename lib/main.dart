import 'package:flutter/material.dart';

import 'screens/login.dart';
import 'screens/product.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        dividerColor: const Color(0xFFECEDF1),
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch().copyWith(background: Colors.white, secondary: Colors.cyan[600]!),
        fontFamily: 'Montserrat',
        textTheme: const TextTheme(
          displayMedium: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          titleSmall: TextStyle(fontSize: 16),
          bodyLarge: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
          headlineMedium: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat1', color: Colors.white),
          headlineSmall: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat', color: Colors.black54),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce UI Kit',
      home: LoginScreen(),
      routes: {
        '/product': (context) => ProductPage(),
      },
    );
  }
}

class TabLayoutDemo extends StatelessWidget {
  const TabLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.yellow,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            children: [
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.orange,
              ),
              Container(
                color: Colors.lightGreen,
              ),
              Container(
                color: Colors.red,
              ),
            ],
          ),
          bottomNavigationBar: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.rss_feed),
              ),
              Tab(
                icon: Icon(Icons.perm_identity),
              ),
              Tab(
                icon: Icon(Icons.settings),
              )
            ],
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.red,
          ),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
