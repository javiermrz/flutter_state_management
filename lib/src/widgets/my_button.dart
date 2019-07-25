import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_state_management/src/style.dart';

class MyButton extends StatefulWidget {
  final Function onPressed;
  final IconData icon;
  final String tooltip;

  const MyButton({this.icon, this.onPressed, this.tooltip});

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 56,
      child: RaisedButton(
        shape: CircleBorder(),
        onPressed: _onPressed,
        splashColor: appAccentColor,
        color: appSecondaryContrastColor,
        child: Icon(
          widget.icon,
          size: 32,
          color: appAccentColor,
        ),
      ),
    );
  }

  void _onPressed() {
    widget.onPressed();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
