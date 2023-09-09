// ignore_for_file: constant_identifier_names, no_logic_in_create_state

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String _dialogMessage = "Loading...";

enum ProgressDialogType { Normal, Download }

ProgressDialogType _progressDialogType = ProgressDialogType.Normal;
double _progress = 0.0;

bool _isShowing = false;

class ProgressDialog {
  _MyDialog? _dialog;

  BuildContext? _buildContext, _context;

  ProgressDialog(BuildContext buildContext, ProgressDialogType progressDialogtype) {
    _buildContext = buildContext;

    _progressDialogType = progressDialogtype;
  }

  void setMessage(String mess) {
    _dialogMessage = mess;
    debugPrint("ProgressDialog message changed: $mess");
  }

  void update({double? progress, String? message}) {
    debugPrint("ProgressDialog message changed: ");
    if (_progressDialogType == ProgressDialogType.Download) {
      debugPrint("Old Progress: $_progress, New Progress: $progress");
      _progress = progress!;
    }
    debugPrint("Old message: $_dialogMessage, New Message: $message");
    _dialogMessage = message!;
    _dialog!.update();
  }

  bool isShowing() {
    return _isShowing;
  }

  void hide() {
    if (_isShowing) {
      _isShowing = false;
      Navigator.of(_context!).pop();
      debugPrint('ProgressDialog dismissed');
    }
  }

  void show() {
    if (!_isShowing) {
      _dialog = _MyDialog();
      _isShowing = true;
      debugPrint('ProgressDialog shown');
      showDialog<dynamic>(
        context: _buildContext!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _context = context;
          return Dialog(
              insetAnimationCurve: Curves.easeInOut,
              insetAnimationDuration: const Duration(milliseconds: 100),
              elevation: 10.0,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: _dialog);
        },
      );
    }
  }
}

class _MyDialog extends StatefulWidget {
  _MyDialog();

  final _dialog = _MyDialogState();

  update() {
    _dialog.changeState();
  }

  @override
  State<_MyDialog> createState() {
    return _dialog;
  }
}

class _MyDialogState extends State<_MyDialog> {
  changeState() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _isShowing = false;
    debugPrint('ProgressDialog dismissed by back button');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84.0,
      child: Row(
        children: <Widget>[
          const SizedBox(width: 15.0),
          SizedBox(
            width: 60.0,
            child: Image.asset(
              'assets/images/loading.gif',
            ),
          ),
          const SizedBox(width: 15.0),
          Expanded(
            child: _progressDialogType == ProgressDialogType.Normal
                ? Text(_dialogMessage,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.w400))
                : Stack(
                    children: <Widget>[
                      Positioned(
                        top: 35.0,
                        child: Text(
                          _dialogMessage,
                          style: const TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Positioned(
                        bottom: 15.0,
                        right: 15.0,
                        child: Text(
                          "$_progress/100",
                          style: const TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class MessageBox {
  BuildContext buildContext;
  String message = " ", title = " ";

  MessageBox(this.buildContext, this.message, this.title);

  void show() {
    _showDialog();
  }

  Future? _showDialog() {
    showDialog(
      context: buildContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
          content: SizedBox(
            height: 45.0,
            child: Center(
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                ],
              ),
            ),
          ),
        );
      },
    );
    return null;
  }
}
