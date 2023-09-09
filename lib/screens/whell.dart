import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_shopping_ui_kit/utils/navigator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../models/model.dart';
import '../widgets/board_view.dart';
import 'home.dart';

class WheelFortune extends StatefulWidget {
  const WheelFortune({super.key});

  @override
  State<WheelFortune> createState() => _WheelFortuneState();
}

class _WheelFortuneState extends State<WheelFortune> with SingleTickerProviderStateMixin {
  double _angle = 0;
  double _current = 0;
  AnimationController? _ctrl;
  Animation? _ani;

  final List<Luck> _items = [
    Luck("apple", const Color(0xFF9F6083), "10"),
    Luck("raspberry", const Color(0xFFFDB78B), "30"),
    Luck("grapes", const Color(0xFF57CFE2), "45"),
    Luck("fruit", const Color(0xFF606B7E), "75"),
    Luck("milk", const Color(0xFF24ACE9), "150"),
    Luck("salad", const Color(0xFFFB7C7A), "250"),
    Luck("cheese", const Color(0xFF1BD3AC), "500"),
    Luck("carrot", const Color(0xFFa73737), "1000"),
  ];

  @override
  void initState() {
    super.initState();
    var duration = const Duration(milliseconds: 5000);
    _ctrl = AnimationController(vsync: this, duration: duration);
    _ani = CurvedAnimation(parent: _ctrl!, curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/wheel.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: AnimatedBuilder(
            animation: _ani!,
            builder: (context, child) {
              final value = _ani!.value;
              final angle = value * _angle;
              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 36.0),
                      child: Text(
                        "Quick opportunity",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  BoardView(items: _items, current: _current, angle: angle),
                  _buildGo(),
                  _buildResult(value),
                ],
              );
            }),
      ),
    );
  }

  _buildGo() {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: _animation,
        child: Container(
          alignment: Alignment.center,
          height: 84,
          width: 84,
          child: const Text(
            "START",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  _animation() {
    if (!_ctrl!.isAnimating) {
      var random = Random().nextDouble();
      _angle = 20 + Random().nextInt(5) + random;
      _ctrl!.forward(from: 0.0).then((_) {
        _current = (_current + random);
        _current = _current - _current ~/ 1;
        _alert(context); //end whell
        _ctrl!.reset();
      });
    }
  }

  _alert(BuildContext context) {
    var alertStyle = AlertStyle(
      animationType: AnimationType.shrink,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: const TextStyle(fontWeight: FontWeight.bold),
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: const TextStyle(
        color: Color.fromRGBO(0, 179, 134, 1.0),
      ),
    );
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.none,
      title: "Free Points",
      desc: "You earned points. You can use it in your shopping.",
      buttons: [
        DialogButton(
          onPressed: () => Nav.route(context, Home()),
          color: const Color.fromRGBO(0, 179, 134, 1.0),
          child: const Text(
            "GO SHOPPING",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    ).show();
  }

  int _calIndex(value) {
    var base = (2 * pi / _items.length / 2) / (2 * pi);
    return (((base + value) % 1) * _items.length).floor();
  }

  _buildResult(value) {
    var index = _calIndex(value * _angle + _current);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.attach_money,
              color: Colors.amber,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              _items[index].point,
              style: const TextStyle(fontSize: 22, color: Colors.amber, fontWeight: FontWeight.w600),
            ),
          ],
        ), //gosterim
      ),
    );
  }
}
