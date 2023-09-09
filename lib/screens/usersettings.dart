import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_shopping_ui_kit/screens/accountsettings.dart';
import 'package:flutter_shopping_ui_kit/screens/checkout.dart';
import 'package:page_transition/page_transition.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: UserSettingsState()),
    );
  }
}

class UserSettingsState extends StatelessWidget {
  const UserSettingsState({super.key});

  @override
  Widget build(BuildContext context) {
    double verticalMargin = 0;
    return SingleChildScrollView(
      child: Parent(
        style: ParentStyle()
          ..margin(vertical: verticalMargin, horizontal: 20)
          ..minHeight(MediaQuery.of(context).size.height - (2 * verticalMargin)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Settings(),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionsRow extends StatelessWidget {
  ActionsRow({super.key});

  Widget _buildActionsItem(String title, IconData icon) {
    return Parent(
      style: actionsItemStyle,
      child: Column(
        children: <Widget>[
          Parent(
            style: actionsItemIconStyle,
            child: Icon(
              icon,
              size: 20,
              color: const Color(0xFF42526F),
            ),
          ),
          Text(
            title,
            style: actionsItemTextStyle,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buildActionsItem('Waiting', Feather.clock),
        _buildActionsItem('Processing', Feather.activity),
        _buildActionsItem('Submitted', Feather.check_circle),
        _buildActionsItem('Pre-order', Feather.repeat),
      ],
    );
  }

  final ParentStyle actionsItemIconStyle = ParentStyle()
    ..alignment.center()
    ..width(50)
    ..height(50)
    ..margin(bottom: 5)
    ..borderRadius(all: 30)
    ..background.color(const Color(0xFFF6F5F8));

  final ParentStyle actionsItemStyle = ParentStyle()..margin(vertical: 20.0);

  final TextStyle actionsItemTextStyle = TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 13);
}

class Settings extends StatelessWidget {
  Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: settingsStyle,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: SettingsItem(Feather.briefcase, 0xFF9F6083, 'Orders', 'All your orders are listed.', () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: Checkout(),
                ),
              );
            }),
          ),
          SettingsItem(
            Feather.settings,
            0xFFFDB78B,
            'Account Settings',
            'General ettings for your account',
            () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: AccountSettings(),
                ),
              );
            },
          ),
          SettingsItem(
            Feather.tag,
            0xFF57CFE2,
            'Discount coupons',
            'Coupons you want to use for your shopping.',
            () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: Checkout(),
                ),
              );
            },
          ),
          SettingsItem(
            Feather.message_circle,
            0xFF606B7E,
            'My Comments',
            'Your comments for products',
            () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: Checkout(),
                ),
              );
            },
          ),
          SettingsItem(
            Feather.bell,
            0xFFFB7C7A,
            'Notifications',
            'Notifications in the app',
            () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: Checkout(),
                ),
              );
            },
          ),
          SettingsItem(
            Feather.help_circle,
            0xFF24ACE9,
            'Help',
            'See here for help',
            () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: Checkout(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  final ParentStyle settingsStyle = ParentStyle();
}

class SettingsItem extends StatefulWidget {
  final IconData icon;
  final int iconBgColor;
  final String title;
  final String description;
  final VoidCallback touchItem;

  const SettingsItem(this.icon, this.iconBgColor, this.title, this.description, this.touchItem, {super.key});

  @override
  State<SettingsItem> createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Parent(
        style: settingsItemStyle
          ..elevation(pressed ? 0 : 50, color: Colors.grey)
          ..scale(pressed ? 0.95 : 1.0),
        gesture: Gestures()
          ..onTap(widget.touchItem)
          ..onTapDown((details) => setState(() => pressed = true))
          ..onTapUp((details) => setState(() => pressed = false))
          ..onTapCancel(() => setState(() => pressed = false)),
        child: Row(
          children: <Widget>[
            Parent(
              style: ParentStyle()
                ..background.color(Color(widget.iconBgColor))
                ..add(settingsItemIconStyle),
              child: Icon(
                widget.icon,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.title,
                  style: itemTitleTextStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.description,
                  style: itemDescriptionTextStyle,
                ),
              ],
            )
          ],
        ));
  }

  final ParentStyle settingsItemStyle = ParentStyle()
    ..alignment.center()
    ..height(70)
    ..margin(vertical: 10)
    ..borderRadius(all: 15)
    ..background.color(const Color(0xFFFFFFFF))
    ..ripple(true)
    ..animate(300, Curves.easeOut);

  final ParentStyle settingsItemIconStyle = ParentStyle()
    ..margin(left: 15)
    ..padding(all: 12)
    ..borderRadius(all: 30);

  final TextStyle itemTitleTextStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  final TextStyle itemDescriptionTextStyle =
      const TextStyle(color: Colors.black26, fontWeight: FontWeight.bold, fontSize: 12);
}
